class AddBoardVideoToBoards < ActiveRecord::Migration[7.0]
  def change
    add_column :boards, :board_video, :string
  end
end
