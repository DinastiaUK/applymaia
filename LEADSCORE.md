# 📊 Regras de Lead Score — Apply Maia

**Threshold para Lead Quente: `≥ 50 pontos`**

- Lead Quente → tela de parabéns + agendamento no Cal.com
- Lead Frio → redirecionamento para `https://n8n.dinastia.uk/webhook/apply-maia` (router WhatsApp)

---

## 🎯 Cargo (até 40 pts)

| Cargo | Pontos |
|-------|--------|
| CEO, Fundador, Sócio, Proprietário, Dono, Owner, Founder | **40** |
| Diretor, VP, Vice-presidente, CTO, CFO, COO, CMO, C-Level | **30** |
| Gerente, Head, Coordenador, Supervisor, Manager | **15** |
| Qualquer outro cargo | **5** |

> Match parcial e case-insensitive — ex: "Co-Fundador" conta como Fundador (40 pts)

---

## 💰 Faturamento Anual (até 40 pts)

| Faturamento | Pontos |
|-------------|--------|
| Acima de R$ 5 milhões | **40** |
| De R$ 1 milhão a R$ 5 milhões | **30** |
| De R$ 500 mil a R$ 1 milhão | **15** |
| De R$ 100 mil a R$ 500 mil | **10** |
| Até R$ 100 mil | **5** |

---

## 👥 Colaboradores — Bônus (até 10 pts)

| Colaboradores | Pontos |
|---------------|--------|
| Mais de 200 | **+10** |
| 51 a 200 | **+8** |
| 16 a 50 | **+5** |
| 6 a 15 | **+3** |
| 1 a 5 | **+1** |

---

## 🔢 Exemplos de Score

| Perfil | Cargo | Faturamento | Colaboradores | Total |
|--------|-------|-------------|---------------|-------|
| 🔥 Hot | CEO | Acima de R$ 5mi | Mais de 200 | **90** |
| 🔥 Hot | Diretor | De R$ 1mi a R$ 5mi | 51 a 200 | **68** |
| 🔥 Hot | CEO | De R$ 500k a R$ 1mi | 6 a 15 | **58** |
| ❄️ Frio | Gerente | Até R$ 100 mil | 1 a 5 | **21** |
| ❄️ Frio | Analista | De R$ 100k a R$ 500k | 6 a 15 | **18** |

---

## ⚙️ Configuração no Código

```javascript
// index.html / typebot_n8n.html
const LEAD_SCORE_THRESHOLD = 50;
```

Para ajustar o threshold ou as pontuações, edite a função `calculateLeadScore()` e a constante `LEAD_SCORE_THRESHOLD`.

---

## 📡 Agendas Cal.com (Rodízio)

| # | Consultora | URL |
|---|-----------|-----|
| 1 | Raquel Mota | `https://cal.com/raquel-mota-byt8nd/dinastia` |
| 2 | Larissa Alvarenga | `https://cal.com/larissa-alvarenga-1grx8k/30min` |

> O rodízio é feito aleatoriamente a cada lead quente.
