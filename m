Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503877C
	for <linux-coco@lists.linux.dev>; Fri, 24 Jun 2022 17:19:19 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id w83so4429273oiw.1
        for <linux-coco@lists.linux.dev>; Fri, 24 Jun 2022 10:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oNiiFv53teFu3CRex5rCry8QLqLkd97P3Hj9fAhbeYc=;
        b=kFAUNKf1rEgkt+OYkPh8tB9E+HPlRDJ57kjd7aaOhWKcIYCN/ZjVerEUwL1D4UqEy6
         jNB2akz9JlmI2z3ciS9Jkc2XEeGMl3dvnEZrG1QqRu/ya7j4cL/8FovPHxIwC5EW6es7
         Ghq27j3amQkzIckOMXvVOxDa7HU8mwaHoI3RREC2uB5mU26z2mV8kUwNG56nJSMHMRqc
         7XxJo0dYVvBtJQS7ebwKtCv1V87zEy9YAPcRV8rTLCfAJuZvL7bdAFhpoy8DPcdAukCV
         I/VMctopfL4nnKopG199aqN6z+kRpGu+YbvvSx5/icPAGuQh+9wvM0ZMI9vQVocoE5BI
         2jZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oNiiFv53teFu3CRex5rCry8QLqLkd97P3Hj9fAhbeYc=;
        b=DY0eJPCq85fv/AdzVe4adoOc3mQsqFT9dADHmNyW6h4DoiqkCQffOQbBVp0NH9p/1Q
         eeTevL+Q3GindaEXRIx2+EEp4PjdY7QWQR20KuU9opkbUDF9N7//cKBveNCanqcr7zPn
         j9LS7tBTuHVTxAw+378Vv6D5sCd8LSr/iH3MyqUyhPNLosEtifCTqHd7JSGGuq235OzH
         vIQbQAn4GqpUrm9T19bcOFfs6lMWNRFZu+a6/gE6PkY+hzhWDEDaMWgb5Fq5zDg81MpF
         VjfhJNFn16MphUOXUqThEK+7aiWzORmVmj5/t4byw0IE9t1RxQfA1RcCevaqFBExJ7NX
         TeAw==
X-Gm-Message-State: AJIora9WKhj/1fX1otzwfvca9vX94uqOBHAsvwXcEOksauHwI0pbbLGJ
	7TaEUnLOVUK/SJhstEW9adCfQPfyVkV7vAh5g5RYTw==
X-Google-Smtp-Source: AGRyM1vH1Tmei+FucmqSWTWHKYA82g8W5CxsahmZ6gIJ+zkpr7Odp70Gu50EcpESE80fWGtWYk5jJ9pFsVncC/eeohY=
X-Received: by 2002:a05:6808:179a:b0:32f:2b07:e733 with SMTP id
 bg26-20020a056808179a00b0032f2b07e733mr2572280oib.218.1656091158204; Fri, 24
 Jun 2022 10:19:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220614120231.48165-1-kirill.shutemov@linux.intel.com>
 <CAMkAt6osbEGBFrgn=y1=x4mDHC1aL40BwaW0NdGHF8qmWd7ktA@mail.gmail.com>
 <5af19000-4482-7eb9-f158-0a461891f087@intel.com> <CAA03e5F480=psSECDAkXQEvNKk3une-4dJV57Hde4z4MMzh=1A@mail.gmail.com>
 <e09dae40-d269-cfed-d048-3e62275c1bb7@intel.com>
In-Reply-To: <e09dae40-d269-cfed-d048-3e62275c1bb7@intel.com>
From: Marc Orr <marcorr@google.com>
Date: Fri, 24 Jun 2022 10:19:07 -0700
Message-ID: <CAA03e5HxiLkOUbOrsgbzVdAUNZvnnryuNcqrz1ZWECtWLwKMXA@mail.gmail.com>
Subject: Re: [PATCHv7 00/14] mm, x86/cc: Implement support for unaccepted memory
To: Dave Hansen <dave.hansen@intel.com>
Cc: Peter Gonda <pgonda@google.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Borislav Petkov <bp@alien8.de>, 
	Andy Lutomirski <luto@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Joerg Roedel <jroedel@suse.de>, 
	Ard Biesheuvel <ardb@kernel.org>, Andi Kleen <ak@linux.intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ingo Molnar <mingo@redhat.com>, Varad Gautam <varad.gautam@suse.com>, 
	Dario Faggioli <dfaggioli@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	David Hildenbrand <david@redhat.com>, Marcelo <marcelo.cerri@canonical.com>, 
	tim.gardner@canonical.com, Khalid ElMously <khalid.elmously@canonical.com>, 
	philip.cox@canonical.com, "the arch/x86 maintainers" <x86@kernel.org>, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, linux-efi@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 24, 2022 at 10:10 AM Dave Hansen <dave.hansen@intel.com> wrote:
>
> On 6/24/22 10:06, Marc Orr wrote:
> > I think Peter's point is a little more nuanced than that. Once lazy
> > accept goes into the guest firmware -- without the feature negotiation
> > that Peter is suggesting -- cloud providers now have a bookkeeping
> > problem. Which images have kernels that can boot from a guest firmware
> > that doesn't pre-validate all the guest memory?
>
> Hold on a sec though...
>
> Is this a matter of
>
>         can boot from a guest firmware that doesn't pre-validate all the
>         guest memory?
>
> or
>
>         can boot from a guest firmware that doesn't pre-validate all the
>         guest memory ... with access to all of that guest's RAM?
>
> In other words, are we talking about "fails to boot" or "can't see all
> the RAM"?

Ah... yeah, you're right, Dave -- I guess it's the latter. The guest
won't have access to all of the memory that the customer is paying
for. But that's still bad. If the customer buys a 96 GB VM and can
only see 4GB because they're kernel doesn't have these patches they're
going to be confused and frustrated.
