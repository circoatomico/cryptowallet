namespace :dev do
  desc "Recreate development database"
  task setup: :environment do
    if Rails.env.development?

      set_message('Dropping database...') do
        %x(rails db:drop)
      end

      set_message('Recreating Database...') do
        %x(rails db:create)
      end

      set_message('Running migrations...') { %x(rails db:migrate) }
      set_message('Seeding database...') { %x(rails dev:add_mining_types) }
      set_message('Seeding database...') { %x(rails dev:add_coins) }

    else
      puts "You are not in development env"
    end

  end

  desc "Seeds mining type table"
  task add_mining_types: :environment do

    set_message('Cadastrando Tipos de Mineração...') do
      miningTypes = 
      [
        {
          description: "Proof of Work",
          acronym: "PoW",
        },
        {
          description: "Proof of Stake",
          acronym: "PoS",
        },
        {
          description: "Proof of Capacity",
          acronym: "PoC",
        }
      ]

      # o uso do ! fará com que o Rails cuspa na tela um erro caso ocorra
      miningTypes.each do |type|
        MiningType.find_or_create_by!(type)
      end
    end
  end

  desc "Seeds coins table"
  task add_coins: :environment do

    set_message('Cadastrando Moedas...') do

      coins = 
      [
        {
          description: "Bitcoin",
          acronym: "BTC",
          url_image: "https://e7.pngegg.com/pngimages/731/0/png-clipart-bitcoin-bitcoin.png",
          mining_type: MiningType.all.sample
        },
        {
          description: "Ethereum",
          acronym: "ETH",
          url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png/600px-ETHEREUM-YOUTUBE-PROFILE-PIC.png",
          mining_type: MiningType.all.sample
        },
        {
          description: "Dash",
          acronym: "DAS",
          url_image: "https://w7.pngwing.com/pngs/37/123/png-transparent-dash-bitcoin-cryptocurrency-digital-currency-logo-bitcoin-blue-angle-text.png",
          mining_type: MiningType.all.sample
        }
      ]

      # o uso do ! fará com que o Rails cuspa na tela um erro caso ocorra
      coins.each do |coin|
        puts Coin.find_or_create_by!(coin)
      end
    end
  end 

  private
    def set_message(msgStart = "Wait...", msgEnd = "OK!")
      spinner = TTY::Spinner.new("[:spinner] " + msgStart.to_s) 
      spinner.auto_spin
      yield
      spinner.success(msgEnd.to_s)
    end
end