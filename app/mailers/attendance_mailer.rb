class AttendanceMailer < ApplicationMailer
    default from: 'no-reply@monsite.fr'

    def welcome_attendance(attendance)

      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    
      @attendance = attendance
      #@user = user

      #on définit une variable @url qu'on utilisera dans la view d’e-mail

      @url  = 'http://monsite.fr/login'

      # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.

      mail(to: @attendance.user.email, subject: 'Salut et merci de vous être inscrit à cet evenemant !')

    end
end
