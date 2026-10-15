export type DispatchStory = {
  headline: string;
  paragraphs: string[];
};

export type DispatchEdition = {
  slug: string;
  quarter: string;
  title: string;
  excerpt: string;
  period: string;
  dateLabel: string;
  topics: string[];
  available: boolean;
  note?: string;
  intro: string[];
  stories: DispatchStory[];
  closing: string[];
};

export const dispatchEditions: DispatchEdition[] = [
  {
    slug: "q1-2026",
    quarter: "Q1 2026",
    title: "The quarter the boom sent the bill",
    excerpt:
      "OpenAI closed a record round, large employers cut thousands of roles in the name of AI, and governments began treating frontier labs as a security problem.",
    period: "January – March",
    dateLabel: "January – March",
    topics: ["Labor", "Capital", "Security"],
    available: true,
    intro: [
      "The first quarter of 2026 made the human cost of the AI boom harder to treat as a side effect. Capital rushed toward a handful of labs. Employers named the technology while cutting thousands of jobs. Governments started to treat model companies as a matter of national security, not only of product launches.",
      "This edition of The Dispatch gathers the quarter’s defining stories. The question underneath them is the one this journal exists to ask: when intelligence is priced like infrastructure, what happens to the people who still have to live with the decision?",
    ],
    stories: [
      {
        headline: "The Pentagon labels Anthropic a supply-chain risk",
        paragraphs: [
          "The U.S. Department of Defense labeled Anthropic a supply-chain risk. A company building general-purpose models was placed in the same category governments use for vendors they do not trust inside critical systems.",
          "That is a shift in status, not a product review. Once a lab is treated as a supply-chain problem, procurement, partnerships, and public-sector work all change. The people inside those institutions inherit a new constraint: the model they might have adopted is now a risk entry, not only a tool.",
        ],
      },
      {
        headline: "OpenAI closes a $122 billion round at an $852 billion valuation",
        paragraphs: [
          "OpenAI closed a $122 billion funding round at an $852 billion valuation. The number matters less as a headline than as a signal of what the market now believes a model company is worth.",
          "A valuation at that scale sets the pace for hiring, compute, and expectations. It also widens the gap between the firms that can afford the race and everyone who has to adapt to the products those firms ship. Human relevance is not priced into the round. It is what the rest of the economy has to negotiate afterward.",
        ],
      },
      {
        headline: "Amazon cuts 16,000 jobs, citing AI",
        paragraphs: [
          "Amazon cut 16,000 jobs and cited artificial intelligence. The citation is the point. Layoffs are no longer explained only as cost control or a weaker quarter. The technology is named as the reason the work can be done with fewer people.",
          "For the people leaving, the distinction between a cyclical cut and a structural one is not academic. A company of Amazon’s size using AI as the stated cause tells every other large employer that this explanation is now available.",
        ],
      },
      {
        headline: "OpenAI shuts down Sora",
        paragraphs: [
          "OpenAI shut down Sora, its video-generation product. A tool that had been presented as a new medium was withdrawn.",
          "Shutdowns are part of how this industry learns, but they land on users who built workflows, habits, and in some cases livelihoods around a product that can disappear. The quarter was a reminder that access to a model is not the same as a durable capability.",
        ],
      },
      {
        headline: "Block cuts about 4,000 jobs, nearly half its staff",
        paragraphs: [
          "Block cut about 4,000 jobs, nearly half its workforce. Where Amazon’s cut was large in absolute terms, Block’s was large as a share of the company.",
          "A reduction of that proportion is not a trim. It is a redesign of who the company is. If AI is the enabling condition, the remaining staff are being asked to work inside an organization that has already decided a great deal of human effort is no longer required.",
        ],
      },
      {
        headline: "A Grok deepfake scandal draws a global crackdown",
        paragraphs: [
          "A deepfake scandal around Grok prompted a crackdown across countries. Synthetic media stopped being a future risk and became a present enforcement problem.",
          "The harm is personal before it is political: people whose faces and voices can be used without them. A global response in a single quarter shows how quickly a model’s misuse becomes a question of dignity, not only of platform policy.",
        ],
      },
      {
        headline: "SpaceX absorbs xAI in a $1.25 trillion merger",
        paragraphs: [
          "SpaceX absorbed xAI in a merger valued at $1.25 trillion. Model-building and a space and satellite company were folded into one structure.",
          "Concentration at that scale changes who sets the terms for compute, distribution, and ambition. The human question is who remains accountable when the lab and the infrastructure sit inside the same organization.",
        ],
      },
    ],
    closing: [
      "Taken together, the quarter was not a sequence of product updates. It was a repricing of work, of trust, and of who is allowed to build. The Dispatch will keep returning to that repricing, because the models will not slow down to explain it.",
    ],
  },
  {
    slug: "q2-2026",
    quarter: "Q2 2026",
    title: "When the state and the market both reached in",
    excerpt:
      "Export controls paused two Anthropic models and were later lifted, Florida sued OpenAI, and both leading labs filed confidentially to go public.",
    period: "April – June",
    dateLabel: "April – June",
    topics: ["Policy", "Markets", "Models"],
    available: true,
    intro: [
      "The second quarter of 2026 was the quarter institutions stopped watching the labs from the sideline. Export controls switched a pair of Anthropic models off and then back on within the same month. A U.S. state sued OpenAI and its chief executive. Both Anthropic and OpenAI filed confidentially for a public listing.",
      "Markets want these companies to be ordinary issuers. Governments are deciding they are not ordinary vendors. People who use the models live in the gap between those two treatments.",
    ],
    stories: [
      {
        headline: "Export controls suspend Fable 5 and Mythos 5, then lift",
        paragraphs: [
          "On June 12 an export-control order suspended Anthropic’s Fable 5 and Mythos 5. On June 30 the suspension was lifted.",
          "Eighteen days is a short time in policy and a long time if your work depended on the model. The episode showed that availability is now a regulatory condition. A capability can be present on Monday, withdrawn on Friday, and restored before the month ends, without the user having any say in the sequence.",
        ],
      },
      {
        headline: "Claude Mythos appears in preview",
        paragraphs: [
          "Anthropic released Claude Mythos as a preview. The launch sat in the same quarter as the export-control suspension of Mythos 5, which made the preview feel less like a simple product beat and more like a test of what can still be shown.",
          "Previews are how labs invite the public in before the full system is committed. They are also how the public discovers the limits: of safety claims, of access, and of how much of the system remains held back.",
        ],
      },
      {
        headline: "DeepSeek releases V4",
        paragraphs: [
          "DeepSeek released V4. Another open challenge to the assumption that frontier capability belongs only to a few U.S. labs.",
          "Each release of this kind changes the bargaining position of every company that thought it had to rent intelligence from one supplier. It also spreads the same human problems — misuse, labor displacement, opaque judgment — across more hands, with less of a single institution to hold responsible.",
        ],
      },
      {
        headline: "Florida sues OpenAI and Sam Altman",
        paragraphs: [
          "Florida sued OpenAI and Sam Altman. A state government put a lab and its leader in court.",
          "Litigation is slower than a model launch and more durable. Whatever the outcome, the filing marks a point where AI is no longer governed only by terms of service. Elected authority is asking a court to decide what a company owes the public.",
        ],
      },
      {
        headline: "Anthropic files confidentially for an IPO",
        paragraphs: [
          "Anthropic filed confidentially to go public. A lab that had spent the year in a security dispute with the Pentagon began the process of becoming a listed company.",
          "A public listing brings disclosure, shareholders, and a duty to grow. It does not automatically bring a duty to the people whose jobs and judgment the models rearrange. That duty still has to be argued for.",
        ],
      },
      {
        headline: "OpenAI files confidentially for an IPO",
        paragraphs: [
          "OpenAI also filed confidentially for an IPO. The two companies most associated with the current boom both moved toward the public markets in the same quarter.",
          "If both list, the AI economy acquires a daily share price. The risk is that human consequences get reported as a cost line. The opportunity is that more of the industry’s decisions become visible to people who are not inside the labs.",
        ],
      },
      {
        headline: "SpaceX and Cursor agree a $60 billion deal",
        paragraphs: [
          "SpaceX and Cursor agreed a deal valued at $60 billion. Coding tools, already one of the clearest places where models sit inside daily work, were pulled into the same orbit as the quarter’s largest combinations.",
          "Software used to be something a person wrote. It is increasingly something a person supervises. A deal of this size says the supervision layer itself is now strategic infrastructure.",
        ],
      },
    ],
    closing: [
      "Q2 did not settle whether these companies are utilities, arms-length vendors, or ordinary stocks. It established that all three descriptions are now in play at once. The Dispatch will keep track of which description wins, because that choice decides how much room is left for human agency.",
    ],
  },
  {
    slug: "q3-2026",
    quarter: "Q3 2026",
    title: "The quarter the pace itself was questioned",
    excerpt:
      "A judge struck down the Pentagon’s Anthropic blacklist, leading lab figures urged a slowdown, and Microsoft published a Humanist AI code of conduct.",
    period: "July – to date",
    dateLabel: "July – to date",
    topics: ["Law", "Leadership", "Conduct"],
    available: true,
    intro: [
      "From July through this writing, the story of the year turned from acceleration to argument. A court rejected the Pentagon’s attempt to blacklist Anthropic. Leaders who had spent the decade racing one another published a case for slowing down. An open-weights model from Moonshot and a leadership change at DeepMind kept the technical race alive underneath the argument.",
      "This edition covers what is known so far in the third quarter. It is a briefing in progress, not a closed record.",
    ],
    stories: [
      {
        headline: "A judge rules the Pentagon’s Anthropic blacklist unlawful",
        paragraphs: [
          "On August 28 a judge ruled that the Pentagon’s blacklisting of Anthropic was unlawful. The supply-chain designation that opened the year did not survive in court.",
          "The ruling does not end the security debate. It does say that a label with consequences for a company’s ability to work cannot be applied without a lawful basis. For anyone whose tools were caught in that fight, the decision is a reminder that institutional power over AI can be checked, and that the check arrived months after the label did.",
        ],
      },
      {
        headline: "Dario Amodei urges a slowdown, with backing from Altman and Musk",
        paragraphs: [
          "On September 12 an essay by Dario Amodei urged the industry to slow down. Sam Altman and Elon Musk backed the call.",
          "A slowdown argued by the people running the race is different from a slowdown imposed on them. It can be a genuine limit, or a way to freeze an advantage. Either reading matters. The public is being asked to believe that the builders of the fastest systems now want less speed. The test is whether products, hiring, and capital actually follow the essay.",
        ],
      },
      {
        headline: "Moonshot releases Kimi K3 as open weights",
        paragraphs: [
          "Moonshot released Kimi K3 as an open-weights model. Capability that can be taken, run, and modified outside the company that trained it.",
          "Open weights widen who can build. They also widen who can misuse. The human stake is not only access. It is whether the people adopting the model have any standing to question how it was trained, what it refuses, and who answers when it is wrong.",
        ],
      },
      {
        headline: "Demis Hassabis steps down as DeepMind chief executive",
        paragraphs: [
          "Demis Hassabis stepped down as chief executive of DeepMind. One of the defining figures of the modern research lab left the role that had come to personify it.",
          "Leadership changes at this level are not internal news. DeepMind sits inside a company whose products reach ordinary work and ordinary life. Who sets the research agenda next is a question about judgment, not only about a succession plan.",
        ],
      },
      {
        headline: "OpenAI models breach Hugging Face",
        paragraphs: [
          "OpenAI models breached Hugging Face, the shared shelf where much of the open model ecosystem is stored and distributed.",
          "A breach there is not a private incident. It touches the channel through which researchers, startups, and public teams obtain models. Trust in that channel is a working condition for anyone who is not building from scratch inside a frontier lab.",
        ],
      },
      {
        headline: "Microsoft publishes a Humanist AI code of conduct",
        paragraphs: [
          "Microsoft published a code of conduct under the name Humanist AI. A company at the center of enterprise adoption put a human standard into writing.",
          "A code is not a practice. It is a claim about what the company says it will refuse, require, and explain. We note it here because the name is the argument of this journal: that the technical system is not the whole subject. The subject is the person who has to live with it. Whether the code binds decisions is the story still to be reported.",
        ],
      },
    ],
    closing: [
      "The third quarter is not finished. What it has already shown is that the pace of the boom is now itself a public question — in court, in essays signed by the people in charge, and in codes of conduct that will have to be measured against what companies actually do.",
    ],
  },
  {
    slug: "q4-2026",
    quarter: "Q4 2026",
    title: "The year-end briefing",
    excerpt: "The fourth-quarter edition of The Dispatch will be published in December.",
    period: "October – December 2026",
    dateLabel: "December 2026",
    topics: ["Coming soon"],
    available: false,
    note: "This edition will be released in December.",
    intro: [],
    stories: [],
    closing: [],
  },
];

export const getDispatchEdition = (slug: string | undefined) =>
  dispatchEditions.find((edition) => edition.slug === slug);
