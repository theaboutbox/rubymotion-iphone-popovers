class PopoverController < UIViewController
  def viewDidLoad
    super
    self.view.backgroundColor = UIColor.whiteColor

    @choices = ['Choice 1', 'Choice 2', 'Choice 3']

    @button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @button.frame = [[10,10],[80,40]]
    @button.setTitle(@choices[0], forState: UIControlStateNormal)
    @button.setTitleColor(UIColor.blueColor, forState: UIControlStateNormal)
    @button.addTarget(self, action: 'show_popover', forControlEvents: UIControlEventTouchUpInside)
    self.view.addSubview @button
  end

  def show_popover
    PopoverView.showPopoverAtPoint([50,50], inView: self.view, withStringArray: @choices, delegate: self)
  end

  def popoverView(popoverView, didSelectItemAtIndex: index)
    @button.setTitle(@choices[index], forState: UIControlStateNormal)
    popoverView.dismiss
  end

end