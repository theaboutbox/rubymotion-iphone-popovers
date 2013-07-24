# Public: A button that shows a popover when pressed updating the text
# of the button to reflect the chosen value of the popover. This class
# is implemented as a subclass of UIButton so that it can be placed and
# styled like any other UIButton
#
# Delegate protocol:
#
# popoverView:valueDidChange - called when the user selects new value
#
class PopoverButtonView < UIButton
  # Public: Initialize this instance with a frame and an appearance position
  # for the popover
  #
  # frame    - CGRect for the button's frame
  # position - Symbol representing position of popover:
  #            :top    - Position popover on top of button
  #            :bottom - Position popover on bottom of button
  #
  def initWithFrame(frame, position: position)
    super
    @position = position
    addTarget(self, action: 'show_popover', forControlEvents: UIControlEventTouchUpInside)
  end

  # Public: Sets the array of popover values
  def popover_values=(values)
    @popover_values = values
  end

  # Public: Gets the array of popover values
  def popover_values
    @popover_values
  end

  # Public: Sets the delegate for this view
  def delegate=(delegate)
    @delegate = WeakRef.new(delegate)
  end

  # Internal: Displays the popover for this view
  def show_popover
    popover_x = self.frame.origin.x + self.frame.size.width/2
    if @position == :top
      popover_y = self.frame.origin.y
    else
      popover_y = self.frame.origin.y + self.frame.size.height
    end
    PopoverView.showPopoverAtPoint([popover_x,popover_y], inView: self.superview, withStringArray: @popover_values, delegate: self)
  end

  # Internal: Delegate method called by popover view indicating that the user selected
  # a value, by index. Convert that to a string value and call our view's delegate
  def popoverView(popoverView, didSelectItemAtIndex: index)
    new_value = @popover_values[index]
    #setTitle(new_value, forState: UIControlStateNormal)
    @delegate.popoverButtonView(self, valueDidChange: new_value)
    popoverView.dismiss
  end

end