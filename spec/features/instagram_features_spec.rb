require 'rails_helper'

feature 'posts' do
  context 'no posts uploaded yet' do
    scenario 'should display a prompt for a new post' do
      visit '/posts'
      expect(page).to have_content 'No posts uploaded yet'
      expect(page).to have_link 'New Post'
    end
  end

  context 'post uploaded' do
    scenario 'display images' do
      visit '/posts'
      click_link 'New Post'
      fill_in 'Title', with: 'Afternoon Tea'
      attach_file('Image', './app/assets/images/afternoon-tea.jpg')
      click_button 'Create Post'
      expect(page).to have_content('Afternoon Tea')
      expect(page).not_to have_content('No posts uploaded yet')
    end
  end

  # context 'viewing posts on their own page' do
  #   let!(:tea){ Post.create(title: 'Afternoon Tea', image: Post.image.url) }
  #
  #   scenario 'lets a user view specific posts' do
  #     visit '/posts'
  #     click_link 'Afternoon Tea'
  #     expect(page).to have_content 'Afternoon Tea'
  #     expect(current_path).to eq "/posts/#{tea.id}"
  #   end
  # end

  # context 'editing image titles' do
  #
  #   before { Post.create title: 'Garden Party', id: 1 }
  #   scenario 'let a user edit the title of a post' do
  #     visit '/posts'
  #     click_link 'Edit'
  #     fill_in 'Title', with: 'Afternoon Tea'
  #     click_button 'Update Post'
  #     click_link 'Afternoon Tea'
  #     expect(page).to have_content 'Afternoon Tea'
  #     expect(current_path).to eq '/images/1'
  #   end
  # end
#
#   context 'deleting images' do
#     before { Image.create title: 'Woodland Adventure'}
#
#     scenario 'deletes an image when a user clicks delete' do
#       visit '/images'
#       click_link 'Delete Post'
#       expect(page).not_to have_content 'Woodland Adventure'
#       expect(page).to have_content 'Post deleted successfully'
#     end
#   end
end
