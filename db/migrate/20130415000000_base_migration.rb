class BaseMigration < ActiveRecord::Migration
  def change

    # ----- users -----
    
    create_table "users" do |t|
      t.string   "user_name"
      t.string   "first_name"
      t.string   "middle_name"
      t.string   "last_name"
      t.string   "title"
      t.boolean  "developer",                  :default => false
      t.integer  "sign_in_count",              :default => 0
      t.string   "password_digest"
      t.string   "ip_address"
      t.string   "remember_me_token"
      t.string   "forgot_password_token"
      t.datetime "remember_me_created_at"
      t.datetime "forgot_password_expires_at"
      t.datetime "last_sign_in_at"
      t.timestamps
    end

    #create_table "addresses" do |t|
    #  t.integer  "user_id"
    #  t.string   "typ"
    #  t.string   "address1",   :default => ""
    #  t.string   "address2",   :default => ""
    #  t.string   "city",       :default => ""
    #  t.string   "state",      :default => ""
    #  t.string   "zip",        :default => ""
    #  t.integer  "position"
    #  t.timestamps
    #end
    #
    #create_table "emails" do |t|
    #  t.integer  "user_id"
    #  t.string   "typ"
    #  t.string   "pagable"
    #  t.string   "address"
    #  t.integer  "position"
    #  t.timestamps
    #end
    #
    #create_table "phones" do |t|
    #  t.integer  "user_id"
    #  t.string   "typ"
    #  t.string   "number"
    #  t.string   "sms_email_address"
    #  t.string   "pagable"
    #  t.integer  "position"
    #  t.timestamps
    #end
    #
    #create_table "emergency_contacts" do |t|
    #  t.integer  "user_id"
    #  t.string   "name"
    #  t.string   "number"
    #  t.string   "typ"
    #  t.integer  "position"
    #  t.timestamps
    #end
    #
    #create_table "other_infos" do |t|
    #  t.integer  "user_id"
    #  t.string   "label"
    #  t.string   "value"
    #  t.integer  "position"
    #  t.timestamps
    #end
    #
    #create_table "avatars" do |t|
    #  t.integer  "user_id"
    #  t.string   "avatar_file_name"
    #  t.string   "avatar_content_type"
    #  t.integer  "avatar_file_size"
    #  t.integer  "avatar_updated_at"
    #  t.integer  "position"
    #  t.timestamps
    #end
    #
    #create_table "browser_profiles" do |t|
    #  t.integer  "user_id"
    #  t.string   "ip"
    #  t.string   "browser_type"
    #  t.string   "browser_version"
    #  t.text     "user_agent"
    #  t.string   "ostype"
    #  t.boolean  "javascript"
    #  t.boolean  "cookies"
    #  t.integer  "screen_height"
    #  t.integer  "screen_width"
    #  t.timestamps
    #end

    # ----- member data -----

    create_table "members" do |t|
      t.integer  "user_id"
      t.integer  "team_id"
      t.string   "typ"
      t.boolean  "admin",         :default => false
      t.timestamps
    end

    # ----- team data -----
    
    create_table "teams" do |t|
      t.string "name"
      t.timestamps
    end

    #create_table "roles" do |t|
    #  t.integer  "member_id"
    #  t.string   "typ"
    #  t.datetime "created_at"
    #  t.datetime "updated_at"
    #end

    # ----- team reference -----

    #create_table "team_files" do |t|
    #  t.integer  "member_id"
    #  t.integer  "team_id"
    #  t.string   "team_file_file_extension"
    #  t.string   "team_file_file_name"
    #  t.string   "team_file_file_size"
    #  t.string   "team_file_content_type"
    #  t.string   "team_file_updated_at"
    #  t.boolean  "published",           :default => false
    #  t.integer  "download_count",      :default => 0
    #  t.string   "caption"
    #  t.timestamps
    #end
    #
    #create_table "team_links" do |t|
    #  t.integer  "team_id"
    #  t.integer  "member_id"
    #  t.string   "site_url"
    #  t.string   "caption"
    #  t.boolean  "published",                :default => false
    #  t.string   "link_backup_file_name"
    #  t.string   "link_backup_content_type"
    #  t.integer  "link_backup_file_size"
    #  t.integer  "link_backup_updated_at"
    #  t.integer  "position"
    #  t.datetime "created_at",                                  :null => false
    #  t.datetime "updated_at",                                  :null => false
    #end
    #
    #create_table "team_photos" do |t|
    #  t.integer  "member_id"
    #  t.string   "caption"
    #  t.string   "image_file_name"
    #  t.string   "image_content_type"
    #  t.integer  "image_file_size"
    #  t.integer  "image_updated_at"
    #  t.integer  "position"
    #  t.boolean  "published",          :default => false
    #  t.datetime "created_at",                            :null => false
    #  t.datetime "updated_at",                            :null => false
    #end
    #
    #create_table "team_wikis" do |t|
    #  t.timestamps
    #end

    # ----- event data -----

    #create_table "events" do |t|
    #  t.string   "typ"
    #  t.string   "title"
    #  t.string   "leaders"
    #  t.text     "description"
    #  t.string   "location"
    #  t.decimal  "lat",         :precision => 7, :scale => 4
    #  t.decimal  "lon",         :precision => 7, :scale => 4
    #  t.datetime "start"
    #  t.datetime "finish"
    #  t.boolean  "all_day",                                   :default => true
    #  t.boolean  "published",                                 :default => false
    #  t.timestamps
    #end
    #
    #create_table "periods" do |t|
    #  t.integer  "event_id"
    #  t.integer  "position"
    #  t.datetime "start"
    #  t.datetime "finish"
    #  t.integer  "rsvp_id"
    #  t.timestamps
    #  end
    #
    #create_table "participants" do |t|
    #  t.integer  "member_id"
    #  t.integer  "period_id"
    #  t.string   "comment"
    #  t.datetime "en_route_at"
    #  t.datetime "return_home_at"
    #  t.datetime "signed_in_at"
    #  t.datetime "signed_out_at"
    #  t.timestamps
    #end

    # ----- event reference -----

    #create_table "event_links" do |t|
    #  t.integer  "event_id"
    #  t.integer  "data_link_id"
    #  t.text     "keyval"
    #  t.timestamps
    #end
    #
    #create_table "event_photos" do |t|
    #  t.integer  "event_id"
    #  t.integer  "data_photo_id"
    #  t.text     "keyval"
    #  t.timestamps
    #end
    #
    #create_table "event_reports" do |t|
    #  t.string   "typ"
    #  t.integer  "member_id"
    #  t.integer  "event_id"
    #  t.integer  "period_id"
    #  t.string   "title"
    #  t.text     "data"
    #  t.integer  "position"
    #  t.boolean  "published",  :default => false
    #  t.timestamps
    #end
    #
    #create_table "event_files" do |t|
    #  t.integer  "event_id"
    #  t.integer  "data_file_id"
    #  t.text     "keyval"
    #  t.datetime "created_at",   :null => false
    #  t.datetime "updated_at",   :null => false
    #end

    # ----- cert data -----

    #create_table "certs" do |t|
    #  t.integer  "member_id"
    #  t.string   "typ"
    #  t.date     "expiration"
    #  t.string   "description"
    #  t.string   "comment"
    #  t.string   "link"
    #  t.integer  "position"
    #  t.string   "cert_file"
    #  t.string   "cert_file_name"
    #  t.string   "cert_content_type"
    #  t.string   "cert_file_size"
    #  t.string   "cert_updated_at"
    #  t.datetime "ninety_day_notice_sent_at"
    #  t.datetime "thirty_day_notice_sent_at"
    #  t.datetime "expired_notice_sent_at"
    #  t.timestamps
    #end
    #
    #create_table "alert_subscriptions" do |t|
    #  t.string   "event_typ"
    #  t.string   "role_typ"
    #  t.timestamps
    #end

    # ----- do scheduling data -----

    #create_table "avail_dos" do |t|
    #  t.integer  "member_id"
    #  t.integer  "year"
    #  t.integer  "quarter"
    #  t.integer  "week"
    #  t.string   "typ"
    #  t.string   "comment"
    #  t.timestamps
    #end

    # ----- member availability data -----

    #create_table "avail_ops" do |t|
    #  t.integer  "member_id"
    #  t.date     "start_on"
    #  t.date     "end_on"
    #  t.string   "comment"
    #  t.timestamps
    #end
    #
    #create_table "do_assignments" do |t|
    #  t.integer  "org_id",                  :default => 1
    #  t.integer  "year"
    #  t.integer  "quarter"
    #  t.integer  "week"
    #  t.string   "name"
    #  t.datetime "created_at"
    #  t.datetime "updated_at"
    #  t.integer  "primary_id"
    #  t.integer  "backup_id"
    #  t.datetime "start"
    #  t.datetime "finish"
    #  t.datetime "reminder_notice_sent_at"
    #  t.datetime "alert_notice_sent_at"
    #end

    # ----- paging -----

    #create_table "distributions" do |t|
    #  t.integer  "message_id"
    #  t.integer  "member_id"
    #  t.boolean  "email",                  :default => false
    #  t.boolean  "phone",                  :default => false
    #  t.boolean  "read",                   :default => false
    #  t.boolean  "bounced",                :default => false
    #  t.datetime "read_at"
    #  t.integer  "response_seconds"
    #  t.boolean  "rsvp",                   :default => false
    #  t.string   "rsvp_answer"
    #  t.datetime "created_at"
    #  t.datetime "updated_at"
    #  t.string   "unauth_rsvp_token"
    #  t.datetime "unauth_rsvp_expires_at"
    #end
    #
    #create_table "inbound_mails" do |t|
    #  t.integer  "outbound_mail_id"
    #  t.string   "from"
    #  t.string   "to"
    #  t.string   "uid"
    #  t.string   "subject"
    #  t.string   "label"
    #  t.text     "body"
    #  t.string   "rsvp_answer"
    #  t.datetime "send_time"
    #  t.boolean  "bounced",          :default => false
    #  t.datetime "created_at"
    #  t.datetime "updated_at"
    #  t.boolean  "ignore_bounce",    :default => false
    #end
    #
    #create_table "journals" do |t|
    #  t.integer  "member_id"
    #  t.integer  "distribution_id"
    #  t.string   "action"
    #  t.datetime "created_at"
    #  t.datetime "updated_at"
    #end
    #
    #create_table "messages" do |t|
    #  t.integer  "author_id"
    #  t.string   "ip_address"
    #  t.text     "text"
    #  t.datetime "created_at"
    #  t.datetime "updated_at"
    #  t.string   "format"
    #  t.integer  "linked_rsvp_id"
    #  t.string   "ancestry"
    #  t.integer  "period_id"
    #  t.string   "period_format"
    #end
    #
    #create_table "outbound_mails" do |t|
    #  t.integer  "distribution_id"
    #  t.integer  "email_id"
    #  t.integer  "phone_id"
    #  t.string   "address"
    #  t.string   "label"
    #  t.boolean  "read",            :default => false
    #  t.boolean  "bounced",         :default => false
    #  t.datetime "created_at"
    #  t.datetime "updated_at"
    #  t.datetime "sent_at"
    #end
    #
    #create_table "rsvp_templates" do |t|
    #  t.integer  "position"
    #  t.string   "name"
    #  t.string   "prompt"
    #  t.string   "yes_prompt"
    #  t.string   "no_prompt"
    #  t.datetime "created_at"
    #  t.datetime "updated_at"
    #end
    #
    #create_table "rsvps" do |t|
    #  t.integer  "message_id"
    #  t.string   "prompt"
    #  t.string   "yes_prompt"
    #  t.string   "no_prompt"
    #  t.datetime "created_at"
    #  t.datetime "updated_at"
    #end

  end
end

