# PRD - Formulário de Acesso à Aula Dashboard com IA

## 1. Visão Geral

Formulário de captura de leads no estilo chat conversacional para liberação de acesso à aula "Como criar Dashboard com IA". O formulário coleta informações do lead e envia para o comercial via WhatsApp para liberar o link da aula.

---

## 2. Frase de Abertura

> **"Antes de ter acesso a AULA pra criar Dashboard com IA preciso de algumas informações, são bem rápidas."**

---

## 3. Campos do Formulário

### 3.1 Dados Pessoais

| Campo | Tipo | Placeholder | Obrigatório |
|-------|------|-------------|-------------|
| `nome` | text | "Seu nome completo" | Sim |
| `email` | email | "seu@email.com" | Sim |
| `telefone` | tel | "(00) 00000-0000" | Sim |

### 3.2 Dados da Empresa

| Campo | Tipo | Placeholder/Opções | Obrigatório |
|-------|------|-------------------|-------------|
| `nome_empresa` | text | "Nome da Empresa" | Sim |
| `nicho` | text | "Ex: Tecnologia, Varejo, Saúde..." | Sim |
| `qtd_colaboradores` | select | Ver opções abaixo | Sim |
| `cargo` | select | Ver opções abaixo | Sim |
| `faturamento_mensal` | select | Ver opções abaixo | Sim |
| `principal_gargalo` | text | "Ex: Falta de processos, equipe sobrecarregada..." | Sim |

### 3.3 Opções dos Selects

**Quantidade de Colaboradores (`qtd_colaboradores`):**
- 1 a 5
- 6 a 15
- 16 a 50
- 51 a 200
- Mais de 200

**Cargo (`cargo`):**
- Sócio ou Fundador
- Presidente ou CEO
- C-Level
- Diretor
- Gerente
- Analista

**Faturamento Mensal (`faturamento_mensal`):**
- Até R$ 10 mil
- De R$ 10 mil a R$ 50 mil
- De R$ 50 mil a R$ 100 mil
- De R$ 100 mil a R$ 500 mil
- Acima de R$ 500 mil

---

## 4. Fluxo de Perguntas

```
1. [Frase de abertura] → Qual é o seu nome?
2. Qual é o seu melhor e-mail?
3. Qual é o seu WhatsApp?
4. Qual é o nome da sua empresa?
5. Em qual segmento ou nicho a sua empresa atua?
6. Qual a quantidade de colaboradores hoje?
7. Qual é o seu cargo na empresa?
8. Qual o faturamento mensal da sua empresa?
9. Qual o principal gargalo na sua operação que você gostaria de resolver?
```

**Total de passos:** 9

---

## 5. Design & UX

### 5.1 Estilo Visual (Manter Atual)

| Elemento | Especificação |
|----------|---------------|
| **Font** | Inter (Google Fonts) |
| **Cor Primária** | `#2563eb` (azul) |
| **Header BG** | `#031525` (azul escuro) |
| **Bot Bubble** | `#f1f5f9` (cinza claro) |
| **User Bubble** | `#2563eb` (azul) |
| **Background** | `#f7f7f8` |
| **Border Radius** | 10px (inputs), 20px (container) |

### 5.2 Componentes

- **Header:** Logo MAIA + barra de progresso com dots + contador de passos (X de 9)
- **Chat Area:** Área de scroll com histórico de mensagens
- **Avatar Bot:** Imagem circular 32x32px
- **Bolhas:** Bot (esquerda, cinza), User (direita, azul)
- **Typing Indicator:** 3 dots animados
- **Input Area:** Input dinâmico + botão enviar (seta)
- **Phone Input:** Wrapper especial com bandeira BR + ícone WhatsApp + máscara

### 5.3 Responsividade

- **Mobile (< 641px):** Full-screen, 100dvh
- **Desktop (>= 641px):** Card centralizado 600px, sombra, border-radius 20px
- **Large (>= 1200px):** Card 640px

### 5.4 Animações

- `fadeIn`: Mensagens novas (0.3s ease-in-out)
- `bounce`: Typing indicator dots (1.4s infinite)
- `spin`: Loading spinner (1s linear infinite)
- Transições suaves em inputs e botões

---

## 6. Integrações

### 6.1 Meta Pixel

- **ID:** `495902410236103`
- **Eventos:** `PageView`, `Lead`
- **Advanced Matching:** email, primeiro nome, sobrenome, telefone, país

### 6.2 Webhook

- **URL:** `https://n8n.dinastia.uk/webhook/apply-maia`
- **Método:** POST
- **Content-Type:** application/json
- **Payload:** Todos os campos coletados + lead_classification + UTMs

> **Nota:** A roleta do comercial é feita no workflow do n8n, não no frontend.

### 6.3 UTM Tracking

Capturar automaticamente da URL:
- `utm_campaign`
- `utm_source`
- `utm_medium`
- `utm_content`

---

## 7. Sistema de Classificação de Leads (A-H)

### 7.1 Visão Geral

Os leads são classificados de **A** (melhor) até **H** (pior) com base na combinação de **Cargo** e **Faturamento Mensal**.

### 7.2 Matriz de Classificação

|                          | Acima de R$ 500k | R$ 100k - R$ 500k | R$ 50k - R$ 100k | R$ 10k - R$ 50k | Até R$ 10k |
|--------------------------|------------------|-------------------|------------------|-----------------|------------|
| **CEO/Fundador/Sócio**   | A                | A                 | B                | C               | D          |
| **Presidente/CEO**       | A                | A                 | B                | C               | D          |
| **C-Level**              | A                | B                 | B                | C               | E          |
| **Diretor**              | B                | B                 | C                | D               | E          |
| **Gerente**              | C                | C                 | D                | E               | F          |
| **Analista**             | D                | E                 | F                | G               | H          |

### 7.3 Descrição das Classificações

| Classe | Descrição | Perfil |
|--------|-----------|--------|
| **A** | Lead Premium | Decisor + Alto faturamento - Prioridade máxima |
| **B** | Lead Excelente | Decisor ou alto cargo + Bom faturamento |
| **C** | Lead Bom | Perfil intermediário com potencial |
| **D** | Lead Regular | Algum potencial, mas com limitações |
| **E** | Lead Baixo | Perfil com pouco poder de decisão ou baixo faturamento |
| **F** | Lead Muito Baixo | Combinação desfavorável cargo/faturamento |
| **G** | Lead Fraco | Improvável conversão |
| **H** | Lead Descartável | Não se encaixa no ICP - Sem potencial |

### 7.4 Bônus por Colaboradores (Opcional)

Pode-se aplicar upgrade de 1 nível para empresas maiores:

| Colaboradores | Ajuste |
|---------------|--------|
| Mais de 200 | Upgrade 1 nível (ex: B → A) |
| 51 a 200 | Upgrade 1 nível se classe C ou inferior |
| 16 a 50 | Sem ajuste |
| 6 a 15 | Sem ajuste |
| 1 a 5 | Sem ajuste |

### 7.5 Lógica de Implementação

```javascript
function classifyLead(cargo, faturamento, colaboradores) {
    // Matriz base [cargo_index][faturamento_index]
    const matrix = {
        'Sócio ou Fundador':  ['A', 'A', 'B', 'C', 'D'],
        'Presidente ou CEO':  ['A', 'A', 'B', 'C', 'D'],
        'C-Level':            ['A', 'B', 'B', 'C', 'E'],
        'Diretor':            ['B', 'B', 'C', 'D', 'E'],
        'Gerente':            ['C', 'C', 'D', 'E', 'F'],
        'Analista':           ['D', 'E', 'F', 'G', 'H']
    };

    const faturamentoIndex = {
        'Acima de R$ 500 mil': 0,
        'De R$ 100 mil a R$ 500 mil': 1,
        'De R$ 50 mil a R$ 100 mil': 2,
        'De R$ 10 mil a R$ 50 mil': 3,
        'Até R$ 10 mil': 4
    };

    let classification = matrix[cargo][faturamentoIndex[faturamento]];

    // Bônus por colaboradores
    if (colaboradores === 'Mais de 200' && classification !== 'A') {
        classification = String.fromCharCode(classification.charCodeAt(0) - 1);
    } else if (colaboradores === '51 a 200' && classification >= 'C') {
        classification = String.fromCharCode(classification.charCodeAt(0) - 1);
    }

    return classification;
}
```

---

## 8. Fluxo Pós-Formulário

### 8.1 Processo

```
┌─────────────────────────────────────────────────────────────────┐
│                         FRONTEND                                │
├─────────────────────────────────────────────────────────────────┤
│ 1. Usuário completa todas as perguntas                          │
│ 2. Sistema calcula a classificação do lead (A-H)                │
│ 3. Dispara evento Lead para Meta Pixel                          │
│ 4. Envia dados para webhook n8n                                 │
│ 5. Exibe mensagem de conclusão para o lead                      │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│                     N8N WORKFLOW                                │
│         https://n8n.dinastia.uk/webhook/apply-maia              │
├─────────────────────────────────────────────────────────────────┤
│ 6. Recebe dados do lead                                         │
│ 7. **ROLETA:** Sorteia entre os 2 números do comercial          │
│ 8. Envia notificação para o comercial sorteado (WhatsApp API)   │
│ 9. Comercial recebe e envia link da aula para o lead            │
└─────────────────────────────────────────────────────────────────┘
```

### 8.2 Roleta do Comercial (Implementar no N8N)

No workflow do n8n, adicionar um nó **Code** para fazer a roleta:

```javascript
// Roleta entre 2 números do comercial
const COMERCIAL_NUMBERS = [
    '+5511999999999',  // Comercial 1 - [NOME]
    '+5511888888888'   // Comercial 2 - [NOME]
];

const selectedIndex = Math.floor(Math.random() * COMERCIAL_NUMBERS.length);
const comercialNumber = COMERCIAL_NUMBERS[selectedIndex];

return {
    ...items[0].json,
    comercial_assigned: comercialNumber
};
```

### 8.3 Mensagem para o Comercial (via WhatsApp API no N8N)

```
🎯 Novo Lead - Aula Dashboard IA

👤 Nome: {nome}
📧 Email: {email}
📱 WhatsApp: {telefone}
🏢 Empresa: {nome_empresa}
📊 Nicho: {nicho}
👥 Colaboradores: {qtd_colaboradores}
💼 Cargo: {cargo}
💰 Faturamento: {faturamento_mensal}
🎯 Gargalo: {principal_gargalo}

⭐ Classificação: {lead_classification}

📩 Enviar link da aula para o lead.
```

### 8.4 Mensagem de Conclusão para o Lead

Após envio:
> "Perfeito! Suas informações foram enviadas. Em instantes você receberá o link da aula no seu WhatsApp."

---

## 9. Dados Enviados ao Webhook

### 9.1 Payload do Frontend → N8N

```json
{
  "nome": "João Silva",
  "email": "joao@empresa.com",
  "telefone": "+5511999999999",
  "nome_empresa": "Empresa X",
  "nicho": "Tecnologia",
  "qtd_colaboradores": "6 a 15",
  "cargo": "Sócio ou Fundador",
  "faturamento_mensal": "De R$ 100 mil a R$ 500 mil",
  "principal_gargalo": "Falta de processos definidos",
  "lead_classification": "A",
  "utm_campaign": "...",
  "utm_source": "...",
  "utm_medium": "...",
  "utm_content": "...",
  "created_at": "2024-01-15T10:30:00Z"
}
```

### 9.2 Dados Adicionados pelo N8N (após roleta)

```json
{
  "comercial_assigned": "+5511999999999",
  "comercial_name": "Nome do Comercial"
}
```

---

## 10. Arquivos do Projeto

| Arquivo | Descrição |
|---------|-----------|
| `index.html` | Formulário principal |
| `avatar.png` | Avatar do bot |
| `nginx.conf` | Configuração do servidor |
| `Dockerfile` | Container Docker |
| `PRD.md` | Este documento |

---

## 11. Configurações a Definir

- [x] **Webhook URL:** `https://n8n.dinastia.uk/webhook/apply-maia`
- [ ] **Comercial 1:** Nome e número WhatsApp (configurar no n8n)
- [ ] **Comercial 2:** Nome e número WhatsApp (configurar no n8n)
- [ ] **Link da Aula:** URL da aula a ser enviada pelo comercial

---

## 12. Checklist de Implementação

### Frontend (index.html)
- [ ] Atualizar frase de abertura
- [ ] Adicionar campo `nome` como primeira pergunta
- [ ] Adicionar campo `email` como segunda pergunta
- [ ] Adicionar campo `telefone` como terceira pergunta
- [ ] Adicionar campo `faturamento_mensal` (select)
- [ ] Remover pergunta "melhor turno"
- [ ] Implementar sistema de classificação A-H
- [ ] Atualizar total de steps no header (9 passos)
- [ ] Enviar dados para `https://n8n.dinastia.uk/webhook/apply-maia`
- [ ] Testar Meta Pixel events

### N8N Workflow
- [ ] Configurar workflow para receber webhook `/webhook/apply-maia`
- [ ] Implementar roleta do comercial (2 números)
- [ ] Configurar envio de notificação via WhatsApp API
- [ ] Testar fluxo completo de notificação
