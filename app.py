from telethon import TelegramClient

# Replace these with the values you got from my.telegram.org
api_id = 'YOUR_API_ID'
api_hash = 'YOUR_API_HASH'
session_file = 'your_session'

async def fetch_five_chats(client):
    async for dialog in client.iter_dialogs(limit=5):
        chat_url = f"https://t.me/{dialog.entity.username}" if dialog.entity.username else "Private chat"
        print(f"Chat: {dialog.name}, URL: {chat_url}")
        async for message in client.iter_messages(dialog.id, limit=10):  # Fetch fewer messages for demo purposes
            message_url = f"{chat_url}/{message.id}" if dialog.entity.username else "Private message"
            print(f"Message: {message.text}, URL: {message_url}")

async def main():
    async with TelegramClient(session_file, api_id, api_hash) as client:
        await fetch_five_chats(client)

if __name__ == '__main__':
    import asyncio
    asyncio.run(main())
