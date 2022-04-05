class AddContact
  def self.call(model, params)
    if params[:tel].present? || params[:email].present? || params[:name_contact].present?
      contact = Cargo::Contact.new(tel: params[:tel], email: params[:email],
        name_contact: params[:name_contact])
      model.contacts.push(contact) if contact.save
    end
  end
end
