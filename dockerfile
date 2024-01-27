FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ./dockerpractice.csproj ./
RUN dotnet restore "dockerpractice.csproj"
COPY . .
RUN dotnet publish ./dockerpractice.csproj -c Release -o /app/

FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS final
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet","dockerpractice.dll"]
