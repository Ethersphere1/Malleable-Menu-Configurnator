using System;
using System.Collections.Generic;
using System.Text;

namespace Configurnator.ViewModels
{
    public class MainWindowViewModel : ViewModelBase
    {
        public string HomeDirectory { get; set; }
        public string AppIconSize { get; set; }
        public string AppIconColumns { get; set; }
        public string SingleMode { get; set; }
        public string AppAutoAFocus { get; set; }
        public string AppAutoFocusDelay { get; set; }
        public string MenuSelfFocus { get; set; }
        public string MenuSelfFocusRepetitions { get; set; }
        public string MenuSelfFocusInfinite { get; set; }
        public string MenuSelfFocusDelay { get; set; }

        public MainWindowViewModel()
        {
            HomeDirectory = "this";

        }

    }
}
