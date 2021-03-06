React = require 'react/addons'
cx = React.addons.classSet
module.exports = React.createClass
  displayName: 'PenaltyIndicator'
  propTypes:
    penaltyNumber: React.PropTypes.number.isRequired
    skaterPenalty: React.PropTypes.object
    teamStyle: React.PropTypes.object.isRequired
    leftEarly: React.PropTypes.bool
  getDefaultProps: () ->
    leftEarly: false
  displayContent: () ->
    if @props.skaterPenalty? and @props.skaterPenalty.penalty? then @props.skaterPenalty.penalty.code else @props.penaltyNumber
  getStyle: () ->
    @props.teamStyle if @props.skaterPenalty? and @props.penaltyNumber < 6 and not @props.skaterPenalty.penalty.egregious
  render: () ->
    containerClass = cx
      'penalty-indicator text-center text-uppercase bt-box': true
      'box-warning': @props.skaterPenalty? and @props.penaltyNumber is 6
      'box-danger': (@props.skaterPenalty? and @props.penaltyNumber >= 7) or (@props.skaterPenalty?.penalty?.egregious)
    <div className={containerClass} style={@getStyle()}>
      <strong>{@displayContent()}</strong>
      {<span className='dot'>&middot;</span> if @props.skaterPenalty?.sat}
    </div>