Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D3AA53
	for <linux-coco@lists.linux.dev>; Thu,  2 Jun 2022 15:31:52 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-2ff90e0937aso55286527b3.4
        for <linux-coco@lists.linux.dev>; Thu, 02 Jun 2022 08:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8Knz9JmJqm4EucxNHcnCzTZMEqb1eXMDB2BBmxOvSfo=;
        b=A5BEurTXTqPI2SJfMM+0Og5mkfT1VMkGbC38WlggmdEdOivuFGZMJrBOEArKLrgmjd
         ispcV5TBg8MDV6Pw1F93Jo101+POqcpuj3mm1Cx7/NWgjNEQVIrUM26/JOdE6eIM9PNe
         NK5jB9oLoo+rd+ELGFkAdAstHirBUwRDd0X1CRUyvyl4zf02btaqHCrhk1Mo3f2mp9p1
         PwcArktmbaggGkq20umNK6JKAtWRVvfsfnKee0/0oA68IQr72FAwhg3zsPurigPZynB4
         WrPeKRvKMWcdQNpGntCfhvjn3oaDTMSsKRF5TSZ/yGtFOgxPk0tMfTtjbfikgukep6cx
         7O7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8Knz9JmJqm4EucxNHcnCzTZMEqb1eXMDB2BBmxOvSfo=;
        b=fUm6q0Qn4YL+L53Y1GIlOn3nvCD2iY7L7VYFsc+2rC/P8Nk3tLntqWAn/Yr6yW3DeC
         nH77O6h27dBbUImopE/LJ4xTa9BXiA6JOH/FTmZsSSR1t7djzHyHIwqGmAOvsJPMZVoG
         jITOX7gmLpBNRAv15cXoyXQjunlXKFsqEuAuDFJMscVdDyMF5WZoI2GH4v82WvK04MMg
         zBbXd2wNA7wiGK0CaFxc6BHkVnav2dtljHjoUIN4rqdaKKIzf3gT0bD0RCuLkHSB3Pbq
         domelVHCEf4rVvyq8WWIBT30b6R2dryyXLJHEOAggM6dhdmLCPlL2Zv3pjZ3fP0Emhj5
         SfNw==
X-Gm-Message-State: AOAM532zv3yK4+Jqp8L8+FauasXIaSUttiCD5/ht7lStSYV3NxTk03BI
	n80JHZ/FuJ6N+tZjA/NzyA5CaUAJWnnxDpTCo2P+Ng==
X-Google-Smtp-Source: ABdhPJyDgn+XcjAIve032i0v41nPDh9/gB1Ke2pcinTpAdoGGtfFIm2nBM+7mIhCzFsvqob6zbUErmaGn6ssSdJrp54=
X-Received: by 2002:a0d:ca08:0:b0:30c:b11b:8cfc with SMTP id
 m8-20020a0dca08000000b0030cb11b8cfcmr6352036ywd.362.1654183911131; Thu, 02
 Jun 2022 08:31:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220425033934.68551-1-kirill.shutemov@linux.intel.com>
 <20220425033934.68551-7-kirill.shutemov@linux.intel.com> <YnE4ZzzVrxUnr3Uv@zn.tnic>
 <20220506153013.e6v4q2qhuhqumfiu@box.shutemov.name> <YnpGnMoviGoK4Ucq@zn.tnic>
 <CAAH4kHYRxgUNnGRUO473q02q3akLzgiTvbA2qKEP5jq6jFV-uA@mail.gmail.com>
 <Yn4ed1gupKmNz2jn@zn.tnic> <20220513144515.fx2cvo3rjued3vy5@black.fi.intel.com>
 <PH0PR11MB5064B561086BE6350CC1DCDCC5CF9@PH0PR11MB5064.namprd11.prod.outlook.com>
 <CAAH4kHbU4FJ=veYQxncdpYD837M90vq2o2saVaUCJ6=pfuNRpA@mail.gmail.com>
 <0c545c5f-3540-1441-7a7d-359b6795f43a@amd.com> <CAAH4kHYj9WOKngeXYL=KnNb1fXa-MaFGTBGZcBX726Od858Q3A@mail.gmail.com>
 <19ac7bbc-82f1-8350-8638-163303d682b1@amd.com>
In-Reply-To: <19ac7bbc-82f1-8350-8638-163303d682b1@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Thu, 2 Jun 2022 08:31:40 -0700
Message-ID: <CAAH4kHbPyCAxwQgqPpgDQ3bEioHZ+WboUMGTHazxC9f9jEEwWg@mail.gmail.com>
Subject: Re: [PATCHv5 06/12] x86/boot/compressed: Handle unaccepted memory
To: "Gupta, Pankaj" <pankaj.gupta@amd.com>
Cc: "Xu, Min M" <min.m.xu@intel.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Borislav Petkov <bp@suse.de>, 
	"Gao, Jiaqi" <jiaqi.gao@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Borislav Petkov <bp@alien8.de>, "Kirill A. Shutemov" <kirill@shutemov.name>, 
	"Lutomirski, Andy" <luto@kernel.org>, "Christopherson,, Sean" <seanjc@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Rodel, Jorg" <jroedel@suse.de>, 
	Ard Biesheuvel <ardb@kernel.org>, Andi Kleen <ak@linux.intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ingo Molnar <mingo@redhat.com>, Varad Gautam <varad.gautam@suse.com>, 
	Dario Faggioli <dfaggioli@suse.com>, "Hansen, Dave" <dave.hansen@intel.com>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>, "x86@kernel.org" <x86@kernel.org>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"linux-efi@vger.kernel.org" <linux-efi@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 2, 2022 at 5:51 AM Gupta, Pankaj <pankaj.gupta@amd.com> wrote:
> AFAIU the unaccepted memory also stays in buddy (first via slow path)
> and should be accounted automatically in free?
>

No, the last patch adds unaccepted mem as a differently accounted memory type.

> >
> > So when I see 2044MB free vs 7089MB free in my VMs, the two are
> > roughly 5GB different.
>
> Is it possible all memory got allocated with memblock? Maybe some
> variable tests to validate with '/proc/meminfo | grep UnacceptedMem'
> would give you more clue.
>

free -k parses /proc/meminfo for MemFree and SwapFree in
/proc/meminfo, so it sounds like it should also add in UnacceptedMem.
We'll try that. Thanks.




--
-Dionna Glaze, PhD (she/her)
