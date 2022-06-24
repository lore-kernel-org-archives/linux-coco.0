Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F987C
	for <linux-coco@lists.linux.dev>; Fri, 24 Jun 2022 17:06:14 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-101bb9275bcso4572129fac.8
        for <linux-coco@lists.linux.dev>; Fri, 24 Jun 2022 10:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CNj4o58y/LRVMbp0gtHvuuSoOAj5isxfmdswamXi6K0=;
        b=MkHasKomYbS9loFCR6yTgyya6gyA2jpz6NNZRyQJYKW4oQSuwwSFc1O0+9Y+CzVHeJ
         dfcbWHWh7ZpyY02ZnLqvS+K041Ci2tw2whaK9HXsVT7xwvRN5EhYbREV9vyu61bEYxD9
         x4+WcBWjeolE1wF1pC28AoFAkMEgKTSAxMIdHv44bGNEwO+xqjOe7zTfiqp7UiqiTfz/
         gvurZnvU3fxi2A85ArS8/AFoXKBNZX/FIAVVnmdeDQ7aOQL6q2IkW+7VMJtWYlJeByP7
         1ZkZz9Xj0jVq9QN3dPDo5lnIRJgUBxo8qghwufYSoWhKD0p+oDVx9N8VmlMJBHbZSsV1
         +pog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CNj4o58y/LRVMbp0gtHvuuSoOAj5isxfmdswamXi6K0=;
        b=XR/pgI/wwEJJMIbOAkexTrCDt3Bxi0OBPg3TZJcXOU6jPE5GC3jZ88z5YY2Vt7iCUS
         Bmn6XurXzanNKAK3hZ+vS84xMxnvYlRqDG2xm/XumwnMlIQYAidlTnCzXBBQnVTn8wHs
         ENuRLzmmw2vH0eNnzt0IRRDi3OvfJTW/dYTHN92vb96fijGyazEwMkJugrIsxMBv4W/u
         rIiF3Bn8ve1Kl6XiPmByFfji8j8GXNSZROVki4SALASmsIefISdPdJKkEXMz3xcgn35L
         Qdybq0Yhzrw2vbIlwtEGJowPmkvWcQxK4LdUP4bomhlme7c0Tlej6ikYiouPytIfwLsV
         SWow==
X-Gm-Message-State: AJIora/ttb4mq5JarhZrt2pVxDEr/tg7hLG8BwPwATDTimHzHyO8gyoR
	5NAE8xVevEzJ3vrtr2x0glFLigrBYC+OxRRPmuqSig==
X-Google-Smtp-Source: AGRyM1uYB2KAHIawaPG0CfnwZruheDErv9xure2U4x9mVl2PvkUR8kfcV3fRPgldBIkl5mlqCOXRHDMBi8/CvVVjito=
X-Received: by 2002:a05:6870:d620:b0:101:a621:9ea0 with SMTP id
 a32-20020a056870d62000b00101a6219ea0mr2746901oaq.110.1656090373508; Fri, 24
 Jun 2022 10:06:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220614120231.48165-1-kirill.shutemov@linux.intel.com>
 <CAMkAt6osbEGBFrgn=y1=x4mDHC1aL40BwaW0NdGHF8qmWd7ktA@mail.gmail.com> <5af19000-4482-7eb9-f158-0a461891f087@intel.com>
In-Reply-To: <5af19000-4482-7eb9-f158-0a461891f087@intel.com>
From: Marc Orr <marcorr@google.com>
Date: Fri, 24 Jun 2022 10:06:02 -0700
Message-ID: <CAA03e5F480=psSECDAkXQEvNKk3une-4dJV57Hde4z4MMzh=1A@mail.gmail.com>
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

On Fri, Jun 24, 2022 at 9:57 AM Dave Hansen <dave.hansen@intel.com> wrote:
>
> Peter, is your enter key broken?  You seem to be typing all your text in
> a single unreadable paragraph.
>
> On 6/24/22 09:37, Peter Gonda wrote:
> > if a customer incorrectly labels their image it may fail to boot..
>
> You're saying that firmware basically has two choices:
> 1. Accept all the memory up front and boot slowly, but reliably
> 2. Use thus "unaccepted memory" mechanism, boot fast, but risk that the
>    VM loses a bunch of memory.
>
> If the guest can't even boot because of a lack of memory, then the
> pre-accepted chunk is probably too small in the first place.
>
> If the customer screws up, they lose a bunch of the RAM they paid for.
> That seems like a rather self-correcting problem to me.

I think Peter's point is a little more nuanced than that. Once lazy
accept goes into the guest firmware -- without the feature negotiation
that Peter is suggesting -- cloud providers now have a bookkeeping
problem. Which images have kernels that can boot from a guest firmware
that doesn't pre-validate all the guest memory?

The way we've been solving similar bookkeeping problems up to now
(e.g., Which guest can run with CVM features like TDX/SEV enabled?
Which SEV guests can live migrate?) is as follows. We tag images with
feature tags. But this is sort of a hack. And not a great one. It's
confusing to customers, hard for the cloud service provider to
support, and easy to mess up.

It would be better if the guest FW knew whether or not the kernel it
was going to launch supported lazy accept.

That being said, this does seem like a difficult problem to solve,
since it's sort of backward from how things work, in that when the
guest firmware wants to switch between pre-validating all memory vs.
minimizing what it pre-validates, the guest kernel is not running yet!
But if there is some way to do this, it would be a huge improvement
over the current status quo of pushing the feature negotiation up to
the cloud service provider and ultimately the cloud customer.
