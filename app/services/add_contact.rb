class AddContact
  def self.call(model, params)
    if params[:tel].present? || params[:email].present?
      contact = Cargo::Contact.new(tel: params[:tel], email: params[:email])
      model.contacts.push(contact) if contact.save
    end
  end
end
