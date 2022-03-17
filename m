Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9084A84
	for <linux-coco@lists.linux.dev>; Thu, 17 Mar 2022 20:20:49 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id s25so8766760lji.5
        for <linux-coco@lists.linux.dev>; Thu, 17 Mar 2022 13:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ByaGDxG5X1KUgztH3SIHl92iZntE1/kLAfg0SkefsmM=;
        b=EjumO/osdajILuAhSqSQ/Da7QJir8FzyqTQFbc4UpDaN9fXvRfiv40LZLT+eA7gkRB
         3vrFp/3jfymjknQthDrJSkB7xwoAOJvsz5Di0hyjlAaE9gN3uxJTEwY9XyMaCjozjoVc
         HJC0mUBHn0IlY0e7CK/wBrjxwXuJPdYWxPSteqHXsHHQSWOZ0f9MLWUtNY1JHrSc3gJ9
         oxFmp2K8l/AnAaP3yd3LR+9tPCxgtg+5YNpkIsyFWyvAdd/pDdzg6/VBo/pOHywTahXB
         bZW50vBFEwtpEAkIYgnseTsBUvSdfqcEbIBWmWkh9gGTDgrOtN0oRmFiO3hBahEVXDEB
         ijZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ByaGDxG5X1KUgztH3SIHl92iZntE1/kLAfg0SkefsmM=;
        b=TNLqNZ+qbb3J4jSjZQCue+a9kZtOyawH9yh8bkgKp3OGU+4hb6RzCHong9CHhqnVq1
         jn0W5K/re+JZT8b/e27G698pSABntKo12vwmSvAj5p9biVIUg7BgcQPXdytc75mLLpc9
         r6eLxs6GoAYL/tJolO7kuaPhYnKCCRxeK1/rx+VE6v20zh9D2f/wDcPx+pCrWgGW0Z8M
         QLigQSFG8naCUYtSrACgOecoX/+oFrUQnu+SI2wJEnzdY9NQdm0q9vSUsUGh0kRtrmmt
         TO6w47toGUBzfTQ7jAeyNYmq9Fm0xS1j0gC4tvCSDAeZA11mrR+f9faSckJhzOSQEIpf
         XJnA==
X-Gm-Message-State: AOAM5302pnYx5Jbz/53e54n6qwEANUTJ79NP5Kh7KJrEUo4qwr1OtJOT
	byBbY/Cv//HhCGFju1OU5JE+785beYLk83xzS5fcTw==
X-Google-Smtp-Source: ABdhPJwDEfWHv2pGVJTBNzJFj6FyJ5V3aLxhQdKByl4OEnifeiYrk0bX3nPrSRiG85pauGo4XpR1S23j9NY/aPe/dHg=
X-Received: by 2002:a2e:9e81:0:b0:248:7c35:385a with SMTP id
 f1-20020a2e9e81000000b002487c35385amr4103253ljk.527.1647548447219; Thu, 17
 Mar 2022 13:20:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220307213356.2797205-1-brijesh.singh@amd.com>
 <20220307213356.2797205-33-brijesh.singh@amd.com> <CAMkAt6pO0xZb2pye-VEKdFQ_dYFgLA21fkYmnYPTWo8mzPrKDQ@mail.gmail.com>
 <20220310212504.2kt6sidexljh2s6p@amd.com> <YiuBqZnjEUyMfBMu@suse.de>
 <CAMkAt6r==_=U4Ha6ZTmii-JL3htJ3-dD4tc+QBqN7dVt711N2A@mail.gmail.com> <23728EEA-37B8-478E-9576-DBFD6FE2A294@suse.de>
In-Reply-To: <23728EEA-37B8-478E-9576-DBFD6FE2A294@suse.de>
From: Peter Gonda <pgonda@google.com>
Date: Thu, 17 Mar 2022 14:20:35 -0600
Message-ID: <CAMkAt6qeSYbsGCsgu0+mfYoYVxS25OMoRYzhEebFvfZzNkxOaA@mail.gmail.com>
Subject: Re: [PATCH v12 32/46] x86/compressed/64: Add support for SEV-SNP
 CPUID table in #VC handlers
To: Boris Petkov <bp@suse.de>
Cc: Joerg Roedel <jroedel@suse.de>, Michael Roth <michael.roth@amd.com>, 
	Brijesh Singh <brijesh.singh@amd.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, kvm list <kvm@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
	Andy Lutomirski <luto@kernel.org>, Sergio Lopez <slp@redhat.com>, linux-efi@vger.kernel.org, 
	linux-coco@lists.linux.dev, Ingo Molnar <mingo@redhat.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Tony Luck <tony.luck@intel.com>, linux-mm@kvack.org, Jim Mattson <jmattson@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
	Tom Lendacky <thomas.lendacky@amd.com>, David Rientjes <rientjes@google.com>, 
	Dov Murik <dovmurik@linux.ibm.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vlastimil Babka <vbabka@suse.cz>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andi Kleen <ak@linux.intel.com>, Borislav Petkov <bp@alien8.de>, brijesh.ksingh@gmail.com, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Marc Orr <marcorr@google.com>, 
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>, 
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 17, 2022 at 7:11 AM Boris Petkov <bp@suse.de> wrote:
>
> On March 14, 2022 5:34:42 PM UTC, Peter Gonda <pgonda@google.com> wrote:
> >I was also thinking about adding a vcpu run exit reason for
> >termination. It would be nice to get a more informative exit reason
> >than -EINVAL in userspace. Thoughts?
>
> Absolutely - it should be unambiguously clear why we're terminating.
>
> --
> Sent from a small device: formatting sux and brevity is inevitable.

Great, I can work on that too.
