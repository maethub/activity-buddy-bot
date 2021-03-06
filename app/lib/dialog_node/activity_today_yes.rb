class DialogNode::ActivityTodayYes < DialogNode

  INPUT_CONTEXT = [:confirm_activity_today]
  OUTPUT_CONTEXT = [:ask_activity_type]
  
  WAIT_FOR_USER = false

  PRIORITY = 10


  def self.applicable?(context)
    return false unless super
    return false unless context.yes?
    return false if context.has_intent? :activity
    true
  end

  def message
    @context.goal_achievement = 1
    message_for_strategy
  end
end