using Newtonsoft.Json;
using ReactiveUI;
using System.Collections.Generic;
using System.IO;
using System.Windows.Input;

namespace Configurnator.ViewModels
{
    public class MainWindowViewModel : ViewModelBase
    {
        private string homeDirectory;

        public string HomeDirectory
        {
            get => homeDirectory;
            set => this.RaiseAndSetIfChanged(ref homeDirectory, value);
        }

        private string appIconSize;

        public string AppIconSize
        {
            get => appIconSize;
            set => this.RaiseAndSetIfChanged(ref appIconSize, value);
        }

        private string appIconColumns;

        public string AppIconColumns
        {
            get => appIconColumns;
            set => this.RaiseAndSetIfChanged(ref appIconColumns, value);
        }

        private string singleMode;

        public string SingleMode
        {
            get => singleMode;
            set => this.RaiseAndSetIfChanged(ref singleMode, value);
        }

        private string appAutoFocus;

        public string AppAutoFocus
        {
            get => appAutoFocus;
            set => this.RaiseAndSetIfChanged(ref appAutoFocus, value);
        }

        private string appAutoFocusDelay;

        public string AppAutoFocusDelay
        {
            get => appAutoFocusDelay;
            set => this.RaiseAndSetIfChanged(ref appAutoFocusDelay, value);
        }

        private string menuSelfFocus;

        public string MenuSelfFocus
        {
            get => menuSelfFocus;
            set => this.RaiseAndSetIfChanged(ref menuSelfFocus, value);
        }

        private string menuSelfFocusRepetitions;

        public string MenuSelfFocusRepetitions
        {
            get => menuSelfFocusRepetitions;
            set => this.RaiseAndSetIfChanged(ref menuSelfFocusRepetitions, value);
        }

        private string menuSelfFocusInfinite;

        public string MenuSelfFocusInfinite
        {
            get => menuSelfFocusInfinite;
            set => this.RaiseAndSetIfChanged(ref menuSelfFocusInfinite, value);
        }

        private string menuSelfFocusDelay;

        public string MenuSelfFocusDelay
        {
            get => menuSelfFocusDelay;
            set => this.RaiseAndSetIfChanged(ref menuSelfFocusDelay, value);
        }

        public MainWindowViewModel()
        {
            if (File.Exists("malleableconfig.json"))
            {
                string jsonFile = File.ReadAllText(@"malleableconfig.json");
                Dictionary<string, string> menuItems = JsonConvert.DeserializeObject<Dictionary<string, string>>(jsonFile);

                HomeDirectory = menuItems["homeDirectory"];
                AppIconSize = menuItems["appIconSize"];
                AppIconColumns = menuItems["appIconColumns"];
                SingleMode = menuItems["singleMode"];
                AppAutoFocus = menuItems["appAutoFocus"];
                AppAutoFocusDelay = menuItems["appAutoFocusDelay"];
                MenuSelfFocus = menuItems["menuSelfFocus"];
                MenuSelfFocusRepetitions = menuItems["menuSelfFocusRepetitions"];
                MenuSelfFocusInfinite = menuItems["menuSelfFocusInfinite"];
                MenuSelfFocusDelay = menuItems["menuSelfFocusDelay"];
            }

            // HomeDirectory = "this";
            OnClickCommand = ReactiveCommand.Create(() =>
            {
                // Code here will be executed when the button is clicked.
                Dictionary<string, string> menuItems = new Dictionary<string, string>
                {
                    { "homeDirectory", HomeDirectory },
                    { "appIconSize", AppIconSize },
                    { "appIconColumns", AppIconColumns },
                    { "singleMode", SingleMode },
                    { "appAutoFocus", AppAutoFocus },
                    { "appAutoFocusDelay", AppAutoFocusDelay },
                    { "menuSelfFocus", MenuSelfFocus },
                    { "menuSelfFocusRepetitions", MenuSelfFocusRepetitions },
                    { "menuSelfFocusInfinite", MenuSelfFocusInfinite },
                    { "menuSelfFocusDelay", MenuSelfFocusDelay },
                };

                // writing the content to config file
                File.WriteAllText(@"malleableconfig.json", JsonConvert.SerializeObject(menuItems));
            });
        } // constructor

        public ICommand OnClickCommand { get; }
    } // class MainWindowViewModel
} // namespace