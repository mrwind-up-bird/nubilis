<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UsersTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('demo.users')->insert([
            ['name' => 'Max', 'surname' => 'Mustermann', 'street' => 'Musterstraße 1', 'zipcode' => '12345', 'city' => 'Musterstadt', 'county' => 'Musterland', 'country' => 'DE', 'phone' => '030123456', 'mobile' => '0170123456', 'fax' => '030123457', 'website' => 'www.mustermann.de', 'language' => 'DE'],
            ['name' => 'Erika', 'surname' => 'Musterfrau', 'street' => 'Beispielweg 2', 'zipcode' => '67890', 'city' => 'Beispielstadt', 'county' => 'Beispielland', 'country' => 'DE', 'phone' => '040987654', 'mobile' => '0171987654', 'fax' => '040987655', 'website' => 'www.musterfrau.de', 'language' => 'DE'],
            ['name' => 'John', 'surname' => 'Doe', 'street' => 'Example Road 3', 'zipcode' => '54321', 'city' => 'Example City', 'county' => 'Example Land', 'country' => 'US', 'phone' => '213987654', 'mobile' => '0123987654', 'fax' => '213987655', 'website' => 'www.johndoe.com', 'language' => 'EN'],
            ['name' => 'Jane', 'surname' => 'Doe', 'street' => 'Sample Blvd 4', 'zipcode' => '90210', 'city' => 'Sample City', 'county' => 'Sample Land', 'country' => 'US', 'phone' => '404987654', 'mobile' => '0123987654', 'fax' => '404987655', 'website' => 'www.janedoe.com', 'language' => 'EN'],
            ['name' => 'Hans', 'surname' => 'Müller', 'street' => 'Testweg 5', 'zipcode' => '54321', 'city' => 'Teststadt', 'county' => 'Testland', 'country' => 'DE', 'phone' => '089654321', 'mobile' => '0170654321', 'fax' => '089654322', 'website' => 'www.hansmueller.de', 'language' => 'DE'],
            ['name' => 'Anna', 'surname' => 'Schmidt', 'street' => 'Demo Straße 6', 'zipcode' => '10115', 'city' => 'Demostadt', 'county' => 'Demoland', 'country' => 'DE', 'phone' => '030123458', 'mobile' => '0170123458', 'fax' => '030123459', 'website' => 'www.annaschmidt.de', 'language' => 'DE'],
            ['name' => 'Peter', 'surname' => 'Fischer', 'street' => 'Probierweg 7', 'zipcode' => '20457', 'city' => 'Probierstadt', 'county' => 'Probierland', 'country' => 'DE', 'phone' => '040987656', 'mobile' => '0171987656', 'fax' => '040987657', 'website' => 'www.peterfischer.de', 'language' => 'DE'],
            ['name' => 'Marie', 'surname' => 'Weber', 'street' => 'Musterallee 8', 'zipcode' => '50667', 'city' => 'Musterhausen', 'county' => 'Musterland', 'country' => 'DE', 'phone' => '0221987658', 'mobile' => '0171987658', 'fax' => '0221987659', 'website' => 'www.marieweber.de', 'language' => 'DE'],
            ['name' => 'Paul', 'surname' => 'Schneider', 'street' => 'Versuchsgasse 9', 'zipcode' => '80331', 'city' => 'Versuchsstadt', 'county' => 'Versuchsland', 'country' => 'DE', 'phone' => '089654323', 'mobile' => '0170654323', 'fax' => '089654324', 'website' => 'www.paulschneider.de', 'language' => 'DE'],
            ['name' => 'Laura', 'surname' => 'Neumann', 'street' => 'Beispielfeld 10', 'zipcode' => '10623', 'city' => 'Beispieldorf', 'county' => 'Beispielland', 'country' => 'DE', 'phone' => '030123460', 'mobile' => '0170123460', 'fax' => '030123461', 'website' => 'www.lauraneumann.de', 'language' => 'DE'],
            ['name' => 'Michael', 'surname' => 'Meyer', 'street' => 'Exemplarstraße 11', 'zipcode' => '20459', 'city' => 'Exemplarstadt', 'county' => 'Exemplarland', 'country' => 'DE', 'phone' => '040987660', 'mobile' => '0171987660', 'fax' => '040987661', 'website' => 'www.michaelmeyer.de', 'language' => 'DE'],
            ['name' => 'Sabine', 'surname' => 'Koch', 'street' => 'Teststraße 12', 'zipcode' => '50670', 'city' => 'Testhausen', 'county' => 'Testland', 'country' => 'DE', 'phone' => '0221987662', 'mobile' => '0171987662', 'fax' => '0221987663', 'website' => 'www.sabinekoch.de', 'language' => 'DE'],
            ['name' => 'Klaus', 'surname' => 'Richter', 'street' => 'Demosplatz 13', 'zipcode' => '80333', 'city' => 'Demosdorf', 'county' => 'Demosland', 'country' => 'DE', 'phone' => '089654325', 'mobile' => '0170654325', 'fax' => '089654326', 'website' => 'www.klausrichter.de', 'language' => 'DE'],
            ['name' => 'Julia', 'surname' => 'Hoffmann', 'street' => 'Musterweg 14', 'zipcode' => '10627', 'city' => 'Musterhausen', 'county' => 'Musterland', 'country' => 'DE', 'phone' => '030123462', 'mobile' => '0170123462', 'fax' => '030123463', 'website' => 'www.juliahoffmann.de', 'language' => 'DE'],
            ['name' => 'Matthias', 'surname' => 'Krause', 'street' => 'Probierstraße 15', 'zipcode' => '20459', 'city' => 'Probierdorf', 'county' => 'Probierland', 'country' => 'DE', 'phone' => '040987662', 'mobile' => '0171987662', 'fax' => '040987663', 'website' => 'www.matthiaskrause.de', 'language' => 'DE'],
            ['name' => 'Lisa', 'surname' => 'Schulz', 'street' => 'Testweg 16', 'zipcode' => '50672', 'city' => 'Testhausen', 'county' => 'Testland', 'country' => 'DE', 'phone' => '0221987664', 'mobile' => '0171987664', 'fax' => '0221987665', 'website' => 'www.lisaschulz.de', 'language' => 'DE'],
            ['name' => 'Thomas', 'surname' => 'Becker', 'street' => 'Exemplarallee 17', 'zipcode' => '80335', 'city' => 'Exemplardorf', 'county' => 'Exemplarland', 'country' => 'DE', 'phone' => '089654327', 'mobile' => '0170654327', 'fax' => '089654328', 'website' => 'www.thomasbecker.de', 'language' => 'DE'],
            ['name' => 'Nina', 'surname' => 'Wagner', 'street' => 'Musterplatz 18', 'zipcode' => '10629', 'city' => 'Musterdorf', 'county' => 'Musterland', 'country' => 'DE', 'phone' => '030123464', 'mobile' => '0170123464', 'fax' => '030123465', 'website' => 'www.ninawagner.de', 'language' => 'DE'],
            ['name' => 'Sebastian', 'surname' => 'Schröder', 'street' => 'Demoallee 19', 'zipcode' => '20459', 'city' => 'Demostadt', 'county' => 'Demoland', 'country' => 'DE', 'phone' => '040987664', 'mobile' => '0171987664', 'fax' => '040987665', 'website' => 'www.sebastianschröder.de', 'language' => 'DE'],
            ['name' => 'Claudia', 'surname' => 'Lange', 'street' => 'Beispielweg 20', 'zipcode' => '50674', 'city' => 'Beispielstadt', 'county' => 'Beispielland', 'country' => 'DE', 'phone' => '0221987666', 'mobile' => '0171987666', 'fax' => '0221987667', 'website' => 'www.claudialange.de', 'language' => 'DE'],
            ['name' => 'Oliver', 'surname' => 'Lange', 'street' => 'Beispielweg 26', 'zipcode' => '50674', 'city' => 'Beispielstadt', 'county' => 'Beispielland', 'country' => 'DE', 'phone' => '0221987666', 'mobile' => '0171987666', 'fax' => '0221987667', 'website' => 'www.lax.de', 'language' => 'DE'],
        ]);
    }
}
