5.times do |n|
    User.create!(
        user_name: "test_user#{n}",
        user_id: "test_display_user_id#{n}",
        password: "test",
        self_introduction: "test_self_introduction#{n}",
        email: "test_email#{n}@test.com",
        phone_number: "080-0000-#{n}#{n}#{n}#{n}",
        birthday: "2021/12/1 06:44:00",
        image: "",
        can_like_notification: true,
        can_comment_notification: true,
        can_message_notification: true,
        can_calender_notification: true,
        is_delete: false,
        created_at: "2021/12/1 06:44:00",
        updated_at: "2021/12/1 06:44:00",
    )
end

5.times do |n|
    User.all.each do |user|
        Post.create!(
            user_id: user.id,
            message_contents: "test_#{n}",
            post_image: "",
            is_delete: false,
            created_at: "2021/12/1 06:44:00",
        )
    end
end