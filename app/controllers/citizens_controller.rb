class CitizensController < ApplicationController
  before_action :set_citizen, only: [:edit, :update]

  def index
    @citizens = Citizen
                  .search_for(params[:q])
                  .with_initial_date(params[:initial_date])
                  .with_end_date(params[:end_date])
                  .with_status(params[:status])
                  .includes(:address)
                  .order(name: :asc)
                  .page(current_page)
  end

  def new
    @citizen = Citizen.new
    @citizen.build_address
  end

  def create
    @citizen = Citizen.new(form_params)

    if @citizen.save
      message = "Cadastro criado com sucesso!"

      CitizenMailer.new_message(
        citizen: @citizen,
        message: message
      ).deliver

      SmsMessageService.new(
        to: @citizen.phone,
        message: message
      ).send!

      redirect_to citizens_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    params = form_params.to_h
    different_status = @citizen.status != params[:status]

    if @citizen.update(params)
      message = "Seu cadastro foi atualizado para #{@citizen.active? ? "ativo" : "inativo"}"

      CitizenMailer.new_message(
        citizen: @citizen,
        message: message
      ).deliver if different_status

      SmsMessageService.new(
        to: @citizen.phone,
        message: message
      ).send! if different_status

      redirect_to citizens_path
    else
      render :edit
    end
  end

  private

  def form_params
    params.require(:citizen).permit(
      :name,
      :cpf,
      :cns,
      :email,
      :birthdate,
      :phone,
      :status,
      :avatar,
      address_attributes: [
        :id,
        :citizen_id,
        :cep,
        :street,
        :city,
        :state,
        :neighborhood,
        :number,
        :complement,
        :ibge_code
      ]
    )
  end

  def set_citizen
    @citizen = Citizen.find(params[:id])
  end
end
