class PopoverController < UIViewController
  include BubbleWrap::KVO

  attr_accessor :photo_info

  def viewDidLoad
    super
    self.view.backgroundColor = UIColor.whiteColor

    @choices = %w(Ava Clara Mommy Daddy)
    @choices2 = %w(Reading Riting Rithmatic)
    @photo_info = PhotoInfo.new(person: @choices[0], subject: @choices2[0])

    @button = PopoverButtonView.alloc.initWithFrame([[10,10],[80,40]], position: :bottom)
    @button.popover_values = @choices
    @button.layer.setBorderWidth(1.0)
    @button.layer.setCornerRadius(8.0)
    @button.layer.setBorderColor(UIColor.grayColor.CGColor)
    @button.setTitle(@photo_info.person, forState: UIControlStateNormal)
    @button.setTitleColor(UIColor.blueColor, forState: UIControlStateNormal)
    @button.delegate = self
    self.view.addSubview @button

    @button2 = PopoverButtonView.alloc.initWithFrame([[50,200],[80,40]], position: :top)
    @button2.layer.setBorderWidth(1.0)
    @button2.layer.setCornerRadius(8.0)
    @button2.layer.setBorderColor(UIColor.grayColor.CGColor)
    @button2.popover_values = @choices2
    @button2.setTitle(@photo_info.subject, forState: UIControlStateNormal)
    @button2.setTitleColor(UIColor.redColor, forState: UIControlStateNormal)
    @button2.delegate = self
    self.view.addSubview @button2

    observe(self.photo_info, 'person') do |old_value, new_value|
      @button.setTitle(new_value, forState: UIControlStateNormal)
    end

    observe(self.photo_info, 'subject') do |old_value, new_value|
      @button2.setTitle(new_value, forState: UIControlStateNormal)
    end
  end

  def viewDidUnload
    unobserve_all
    super
  end

  def popoverButtonView(popoverButtonView, valueDidChange: new_value)
    if popoverButtonView == @button
      self.photo_info.person = new_value
    else
      self.photo_info.subject = new_value
    end
  end

end