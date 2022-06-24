Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798997C
	for <linux-coco@lists.linux.dev>; Fri, 24 Jun 2022 17:21:39 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id b7so3495344ljr.6
        for <linux-coco@lists.linux.dev>; Fri, 24 Jun 2022 10:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JlWbCSGLtoiUV9s5S4I2VF33Zo7YdAO/mkxevgyN3qY=;
        b=nJBAU9/tj07UZN5FNXK9+/KHQEQgAEeFhyuesPS5GOApEHjX+EZ8Y696xGVH4AETeS
         ozyG1usKOWwfHkZPditLB7l9QicK4TkDG2HiCWPdki2MlZX1iL4p2yuf1q1Jb071k16n
         jiePdSJPriiouBDtb9EghNbRp0ss52hqUMfmne9fPcanCttDFory5YyqoHUCWRNAP1ML
         G72DpjEFAMUtxUL2Kktl2XU6YrKJ2ZxvnZfUghkVW3zPxR9Uv9hUFaLflu9AER3lo/IV
         eIhOUNmapsoBDrQC9vrn4kpCaBRBhq9RHdMCy6YSNwLoY0lGPtuf9lKqoRHV+rzAh1jV
         yhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JlWbCSGLtoiUV9s5S4I2VF33Zo7YdAO/mkxevgyN3qY=;
        b=yibaKNAUUCkDUF57IZJonH2ei/F9eogXplRS0IB22UHZh5XCCx/5xiVvhS622uEF2H
         +1REgy9tK3BLcjFMw+x7BhYIv/B7Uj+f4ujlzH5i1RI5SwNnKzGspLIix1g2vDQ8zbFv
         GPYbdJD3VXLq7IQsRnSb34eFpMfxa5sTOTUR0JXdc0YAJ8I2uJ3HRV44T9KLPDe6J44F
         7oFPirvOOMSDoBv3t7bYiPec2Z0IM5jKc9PWjQvsE6sU787QPW3KLKpwI4kw8EATJEza
         MWKuY3Dkrz3awR75g6VvlSLfyQxuO5NsFhA7HSv5V66PYPECZ4hi2CUVwNH9Uxrj5sOm
         Cw/w==
X-Gm-Message-State: AJIora/uLnH3tJDinb3l6delGY5+ud0v9HKFlKvKPhZZpn03f5Z3sIds
	rWVUTtjQTRLEZBV2L2HAE93JwTC0619JIUoyXcLA0w==
X-Google-Smtp-Source: AGRyM1tyq/jv822hk5wlM5QlG82jddLwlvGXpXf/h4elvz2TSVuZgsSFmh+n0GoDKUeq9/eS1bNdObIlvQ1xDik8nts=
X-Received: by 2002:a2e:b911:0:b0:25a:9942:4171 with SMTP id
 b17-20020a2eb911000000b0025a99424171mr18800ljb.426.1656091297292; Fri, 24 Jun
 2022 10:21:37 -0700 (PDT)
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
In-Reply-To: <CAA03e5HxiLkOUbOrsgbzVdAUNZvnnryuNcqrz1ZWECtWLwKMXA@mail.gmail.com>
From: Peter Gonda <pgonda@google.com>
Date: Fri, 24 Jun 2022 11:21:25 -0600
Message-ID: <CAMkAt6o-nrfvefrRoGk2S3EZPeyx8oO=yDgDgNJvgvunRr-nMw@mail.gmail.com>
Subject: Re: [PATCHv7 00/14] mm, x86/cc: Implement support for unaccepted memory
To: Marc Orr <marcorr@google.com>
Cc: Dave Hansen <dave.hansen@intel.com>, 
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

On Fri, Jun 24, 2022 at 11:19 AM Marc Orr <marcorr@google.com> wrote:
>
> On Fri, Jun 24, 2022 at 10:10 AM Dave Hansen <dave.hansen@intel.com> wrote:
> >
> > On 6/24/22 10:06, Marc Orr wrote:
> > > I think Peter's point is a little more nuanced than that. Once lazy
> > > accept goes into the guest firmware -- without the feature negotiation
> > > that Peter is suggesting -- cloud providers now have a bookkeeping
> > > problem. Which images have kernels that can boot from a guest firmware
> > > that doesn't pre-validate all the guest memory?
> >
> > Hold on a sec though...
> >
> > Is this a matter of
> >
> >         can boot from a guest firmware that doesn't pre-validate all the
> >         guest memory?
> >
> > or
> >
> >         can boot from a guest firmware that doesn't pre-validate all the
> >         guest memory ... with access to all of that guest's RAM?
> >
> > In other words, are we talking about "fails to boot" or "can't see all
> > the RAM"?
>
> Ah... yeah, you're right, Dave -- I guess it's the latter. The guest
> won't have access to all of the memory that the customer is paying
> for. But that's still bad. If the customer buys a 96 GB VM and can
> only see 4GB because they're kernel doesn't have these patches they're
> going to be confused and frustrated.

The other error case which might be more confusing to the customer is
their kernel does have these patches, there is some misconfiguration
and their VM boots slowly because the FW uses the accept all memory
approach.
