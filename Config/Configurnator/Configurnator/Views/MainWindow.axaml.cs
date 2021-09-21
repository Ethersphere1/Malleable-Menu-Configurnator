using Avalonia;
using Avalonia.Controls;
using Avalonia.Markup.Xaml;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;

namespace Configurnator.Views
{
    public partial class MainWindow : Window
    {



        //public string SingleMode { get; set; }
        public MainWindow()
        {
            InitializeComponent();
#if DEBUG
            this.AttachDevTools();
#endif


            //var singleModeComboBox = this.Find<ComboBox>("singleModeComboBox");
            ////fontComboBox.Items = FontManager.Current.GetInstalledFontFamilyNames().Select(x => new FontFamily(x));
            ////fontComboBox.SelectedIndex = 0;

            //Dictionary<string, string> menuItems = new Dictionary<string, string>
            //{
            //    { "singleMode", singleModeComboBox.SelectedIndex.ToString() },
            //};



            //File.WriteAllText(@"malleableconfig.json", JsonConvert.SerializeObject(menuItems));



        }

        private void InitializeComponent()
        {
            AvaloniaXamlLoader.Load(this);
        } // InitializeComponent
    } // class
} // sname space