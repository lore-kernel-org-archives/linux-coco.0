Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3645A1842
	for <linux-coco@lists.linux.dev>; Wed, 20 Jul 2022 00:26:34 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-31e45527da5so59248827b3.5
        for <linux-coco@lists.linux.dev>; Tue, 19 Jul 2022 17:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AXFCfDqvLrq9o9WRcAb2bry5GNfeEVn8GlJpnRDObuY=;
        b=hpR/vH1V8plhuaqeiB0LitY272ggX3bQv0nXd6Y1BK7Bwal8MhI8mqq1jAQjbvj/Wo
         O+/3MIyG9XbRVzS8JgrWNKl87KDU6Eq1+d1hFiW/qgjlFVU/J2bUcja0vmliWIdV5cuy
         GLJRr5o1CbYd4rnWtvQyI+ssrUm7QlB+1im8tGLur7pQHEb16hOL5YLtLdcWkvaBrqGN
         ruD1N7GI152c4a0egyQ0lm3qMW8V5wX3VU1CVrCka/cNse9swyafctm8jQaUghqoZjUS
         ijtU/SJd0WILD2FWaGsfSjESFK4FhyzJ4ayaWMpNsX4UC6eKmD70XnRuMyaoaZu5tHTK
         29UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AXFCfDqvLrq9o9WRcAb2bry5GNfeEVn8GlJpnRDObuY=;
        b=D0k3wBphpInsNgUdyQL6e7FpPfcYGUHYlOjP/YFC3CBDC0vL5ZoEANQwJn3rQA0ilg
         DHhuh/ivfPmGqQzKln2eyOihSoCrA0V1NHym4ackifqQ4LrsDhL1tzWQ2rW3+MvBWgBf
         Q9kBEDvmQFDsjFUXEj1q5XBNQ+rx18kGWu2w63cZ/CIrJeik1zHCxmEPKAZaQ0LBEp8X
         W6EdTOVbbQdFWkaV7bqcl75cN5MeV2SUSj0bIJQ/Ikf/w3yqaZsYau/GY9lgbHbLGzxS
         zz6YVrtcnDrUoS6GDsvfWReH7lefDmaXi5QrDr/e1NB8syi+yJsExqJtzSI7rCl8mIkd
         N8+w==
X-Gm-Message-State: AJIora/H58MMUZ3VUygCgfmbI0D0WITnbvXjKevXKb9mCXQovJBhkzS3
	KCRtIhBUd2MOrcP8+YtGHjASSEBACaMwG6w98e+oEg==
X-Google-Smtp-Source: AGRyM1ucYfvEDqy8c2bJqjvjQcMSu4rDtbwnmg0DLGP5d4Yvdv55/Fz6kUTxYLVBWG5VR5+ybBgntVeWxP1KiCKRMVk=
X-Received: by 2002:a81:49c6:0:b0:31c:7f19:a5f0 with SMTP id
 w189-20020a8149c6000000b0031c7f19a5f0mr38675292ywa.385.1658276792919; Tue, 19
 Jul 2022 17:26:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220627223808.ihgy3epdx6ofll43@black.fi.intel.com>
 <CAMj1kXEdS9SzFZZ4WGH6sR0WDCOgYDZ3Geg6X2sqSnQ-CXXpZA@mail.gmail.com>
 <20220718172159.4vwjzrfthelovcty@black.fi.intel.com> <CAAH4kHYR+VkSJ5J8eWmeaEvstuRz_EuqVQqPfwmp5dhNGRyJwQ@mail.gmail.com>
 <CAAH4kHaHJo4NUb72tHeica4a34hq5u_QP6d6Vuzngf6EqTJ8Aw@mail.gmail.com>
 <CAAH4kHaB2tL+sAn0NAciu5DQeX5hpNkDees=n=f83S=Ph9Y6tw@mail.gmail.com>
 <YtcCWfCQuEsVhH6W@zn.tnic> <CAMj1kXEKtcieycyyFMyuLKJK61FgaDwtLieC0N47W1Sa5LaBsA@mail.gmail.com>
 <YtcgxxMyFTReuuRw@zn.tnic> <bb7479df-7871-9861-600d-c2fed783b659@intel.com>
 <YtcnQbiRgZPtR+rQ@zn.tnic> <22d54786-bc12-ecc5-2b37-cbaa56090aa8@intel.com>
In-Reply-To: <22d54786-bc12-ecc5-2b37-cbaa56090aa8@intel.com>
From: Marc Orr <marcorr@google.com>
Date: Tue, 19 Jul 2022 17:26:21 -0700
Message-ID: <CAA03e5FMEyswDhoXRJ5U_n9RG4QM524aQYpF4473ydnAVJr1PA@mail.gmail.com>
Subject: Re: [PATCHv7 00/14] mm, x86/cc: Implement support for unaccepted memory
To: Dave Hansen <dave.hansen@intel.com>
Cc: Borislav Petkov <bp@alien8.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Dionna Amalie Glaze <dionnaglaze@google.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Peter Gonda <pgonda@google.com>, 
	Andy Lutomirski <luto@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Joerg Roedel <jroedel@suse.de>, 
	Andi Kleen <ak@linux.intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ingo Molnar <mingo@redhat.com>, Varad Gautam <varad.gautam@suse.com>, 
	Dario Faggioli <dfaggioli@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	David Hildenbrand <david@redhat.com>, Marcelo Cerri <marcelo.cerri@canonical.com>, 
	tim.gardner@canonical.com, Khalid ElMously <khalid.elmously@canonical.com>, 
	philip.cox@canonical.com, "the arch/x86 maintainers" <x86@kernel.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, linux-coco@lists.linux.dev, 
	linux-efi <linux-efi@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	"Yao, Jiewen" <jiewen.yao@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 19, 2022 at 3:02 PM Dave Hansen <dave.hansen@intel.com> wrote:
>
> On 7/19/22 14:50, Borislav Petkov wrote:
> > On Tue, Jul 19, 2022 at 02:35:45PM -0700, Dave Hansen wrote:
> >> They're trying to design something that can (forever) handle guests that
> >> might not be able to accept memory.
> > Wait, what?
> >
> > If you can't modify those guests to teach them to accept memory, how do
> > you add TDX or SNP guest support to them?
>
> Mainline today, for instance, doesn't have unaccepted memory support for
> TDX or SEV-SNP guests.  But, they both still boot fine because folks
> either configure it on the host side not to *have* any unaccepted
> memory.  Or, they just live with the small (4GB??) amount of
> pre-accepted memory, which is fine for testing things.

For us (Google cloud), "1. Deal with that at the host level
configuration" looks like:
https://cloud.google.com/compute/docs/images/create-delete-deprecate-private-images#guest-os-features

In other words, we have to tag images with "feature tags" to
distinguish which images have kernels that support which features.

Part of the reason we need to do it this way is that we use a single
guest firmware (i.e., guest UEFI) that lives outside of the image.

These feature tags are a mess to keep track of.

All that being said, I can totally see the upstream perspective being
"not our problem". It's hard to argue with that :-).

A few more thoughts:

- If the guest-side patches weren't upstream before this patch set to
handle unaccepted memory, you're all definitely right, that this isn't
a real issue. (Maybe it still isn't...)
- Do we anticipate (many) more features for confidential compute in
the future that require code in both the guest FW and guest kernel? If
yes, then designing a FW-kernel feature negotiation could be useful
beyond this situation.
- Dave's suggestion to "2. Boot some intermediate thing like a
bootloader that does acceptance ..." is pretty clever! So if upstream
thinks this FW-kernel negotiation is not a good direction, maybe we
(Google) can pursue this idea to avoid introducing yet another tag on
our images.

Thank you all for this discussion.

Thanks,
Marc
