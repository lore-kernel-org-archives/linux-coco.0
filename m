Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B98B7C
	for <linux-coco@lists.linux.dev>; Fri, 24 Jun 2022 18:10:19 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id f39so5830015lfv.3
        for <linux-coco@lists.linux.dev>; Fri, 24 Jun 2022 11:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hcN3XwIcZstb9s64xvU12TX0znKfRFFze9XJS0Qbx3c=;
        b=i388ivDFxBMUiQA7obdzFBcEsHyr2kSx+7nBsDjM07lnEAK/xcdqGFSUgzgUY2x5hz
         DEXehsWQSvUsV1Imkd8PWGjk00nG59mSuOc1lCrJJBgRYyUpD1jYVMip2WU88Ju3wXQC
         9mMUu5erd6kQecAreB6NiXoTvzd9EWpyT6+hFRSjep65bDfex49cbaRobzUMHHHZ0Z84
         eXEGdW5cEkmpQdRIfZYO6ikD12SduftZiMeR9H+O6dCGKcrFYtydLGHlB5ozixdcHDZo
         Sofuo2cji7slhGZ5UqgKB7QK/oxD3m0HAUfdsQDFVoue1IcLToG3jzOqCB83xL9+874H
         Tl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hcN3XwIcZstb9s64xvU12TX0znKfRFFze9XJS0Qbx3c=;
        b=fbMVZOm0jQ9I1txfUjkqRaCqJ5EoqmkyGeF9a/1eT9WtdfCz+fxjfw2NI6mc12hhHV
         TXXP64a7n017zBxJVO6wKazsFb0xzYqc2TLUHFpKAa+H0tyd+DjYtmWVdzZ60ZcTSfr7
         V6jLvYMQInn4JsiXiZeEOvaY4zoghjfQyzVB8WXA7JaJtj5zl/zb28zB1cqaunRqTpIS
         RPxx26notR76bKoc+Vtijp9r9OTF4fustYwNYRCSDzhXQk/by3+YYTf1T1Hb6TNGKxWu
         WdcoWCmf0sIGmLvgFLO+ceM7F9pdYlx0+iGBEyjd8TabIyzvJf+XLdGsFrK2LAzEpBeL
         8+Ig==
X-Gm-Message-State: AJIora/bQCKxZswpSoJqaqGqBwYWl/+5rwEj1NKQNqjpCd+ZTIa3P66a
	Km6vqnquqYtKuxEfEF37jQ5/VOMHd4EHgk56nPxCFQ==
X-Google-Smtp-Source: AGRyM1tdkubN4l5CrWuEurB1wstbops6ikfefa6G3OKJ5WraDCy19/A/YOyuGj3Y9SbrsN+Oqd+6FVxlMDlWtFoEghE=
X-Received: by 2002:ac2:5974:0:b0:47f:92db:4480 with SMTP id
 h20-20020ac25974000000b0047f92db4480mr59927lfp.685.1656094217190; Fri, 24 Jun
 2022 11:10:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220614120231.48165-1-kirill.shutemov@linux.intel.com>
 <CAMkAt6osbEGBFrgn=y1=x4mDHC1aL40BwaW0NdGHF8qmWd7ktA@mail.gmail.com>
 <5af19000-4482-7eb9-f158-0a461891f087@intel.com> <CAA03e5F480=psSECDAkXQEvNKk3une-4dJV57Hde4z4MMzh=1A@mail.gmail.com>
 <e09dae40-d269-cfed-d048-3e62275c1bb7@intel.com> <CAA03e5HxiLkOUbOrsgbzVdAUNZvnnryuNcqrz1ZWECtWLwKMXA@mail.gmail.com>
 <1e7ad728-d796-c84d-b7ba-b96d8f9fcd0c@intel.com>
In-Reply-To: <1e7ad728-d796-c84d-b7ba-b96d8f9fcd0c@intel.com>
From: Peter Gonda <pgonda@google.com>
Date: Fri, 24 Jun 2022 12:10:05 -0600
Message-ID: <CAMkAt6pzMSUuuA7Kc-sVEGw1FYpDoRrKs-dco++2rpqB219_ng@mail.gmail.com>
Subject: Re: [PATCHv7 00/14] mm, x86/cc: Implement support for unaccepted memory
To: Dave Hansen <dave.hansen@intel.com>
Cc: Marc Orr <marcorr@google.com>, 
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

On Fri, Jun 24, 2022 at 11:47 AM Dave Hansen <dave.hansen@intel.com> wrote:
>
> On 6/24/22 10:19, Marc Orr wrote:
> >> Is this a matter of
> >>
> >>         can boot from a guest firmware that doesn't pre-validate all the
> >>         guest memory?
> >>
> >> or
> >>
> >>         can boot from a guest firmware that doesn't pre-validate all the
> >>         guest memory ... with access to all of that guest's RAM?
> >>
> >> In other words, are we talking about "fails to boot" or "can't see all
> >> the RAM"?
> > Ah... yeah, you're right, Dave -- I guess it's the latter. The guest
> > won't have access to all of the memory that the customer is paying
> > for. But that's still bad. If the customer buys a 96 GB VM and can
> > only see 4GB because they're kernel doesn't have these patches they're
> > going to be confused and frustrated.
>
> They'll at least be a _bit_ less angry and frustrated than if they were
> staring at a blank screen. ;)  But, yeah, I totally get the point.

Ha! Well we do have that issue in some cases. If you try to run an SEV
VM with an image that doesn't support SEV you will just get a blank
serial screen. If we had something like this back then the FW could
have surfaced a nice error to the user but that's history now.

>
> How big is the window going to be where we have guests that can have
> unaccepted memory, but don't have acceptance support?  For TDX, it's
> looking like it'll probably _just_ be 5.19.  Is TDX on 5.19 in shape
> that cloud providers can deploy it?  Or, is stuff like lack of
> attestation a deal breaker?

This is complicated because distros don't run upstream linux versions.
If I understand correctly (I see some distro emails on here so please
correct me) distros normally maintain forks which they backport things
into. So I cannot answer this question. It is possible that a
hypothetical distro backports only the SNP/TDX initial patches and
doesn't take these for many releases.

I am more familiar with SNP and it does have some attestation support
in the first patch sets.

Also I should have been more clear. I don't want to try and hold up
this feature but instead discuss a future usability add-on feature.

>
>
