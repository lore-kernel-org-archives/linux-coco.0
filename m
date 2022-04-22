Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7167A
	for <linux-coco@lists.linux.dev>; Fri, 22 Apr 2022 13:24:43 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id w19so14269633lfu.11
        for <linux-coco@lists.linux.dev>; Fri, 22 Apr 2022 06:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Uh/i7pONWs9zNhFkmIOXxH8K9rX2pqq3+dxTkHV4IDc=;
        b=jaaEpWQcqbaEyYdutWZeZdjw+QQcJSdbCS9SFtmkIjJKr2AaQYFmeKaXsRSZNqL/du
         5uA3obMPxfFyjez258m1b1o3+55hDt6FJiMIMDWDq4Wcce1C2cvATWGciaROy62EMuEf
         F6qX6s4f12Eef6QMWAdbw2PzdFVAkvZ/6g9u6GJeE7ms2M0vZyA6a7eXbsB8WedPWvuF
         +FcQspQ/1qjQqM/t+unssU2WbArmsbheEoBeA+Gq2TWwJR2DCcRugpRMkubOnFbxiUbD
         vPq3O5uD/3VmxTCRiieDxY5FMecKZkf+z9RQ8DqinlJg182Sn3YFbeJs3VVUD1Hne/cw
         /oMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Uh/i7pONWs9zNhFkmIOXxH8K9rX2pqq3+dxTkHV4IDc=;
        b=jgpRZ8kI8wlvsh6Qo/SfGjUyjdiYpfPvoX40+o5FmMgAy54lTNTy+mIEeWqD2v3c6y
         8ub/WdCKDnVDWJizBjXOMiefOhV9YRTK1M/tuHlE+Jq/RXiqDLqwTeEWdHXdLnL+uVpf
         DZKn2/iE2l3En8/BJ9rVPlXZ3lQ5mg8cXIwrig5D+0a/ape+TSD7UHGgCUsJ0pKcIvIj
         hflAL6InlMo22hh8KYpahYkcS3IWsi/JJZak9fs+cMmXg/UocVF4pq9S5sDXJ9fJKvel
         GN+KXWZp1Hf0dNBlfTFVyM/75tzyHt3jJW6osqIQNToHiln47S0+SVamxC17J8Bcg+hv
         j4+g==
X-Gm-Message-State: AOAM530/t3H5bdXzv7wowTyFJavusD7LvoqopIoP5WyAMgBDeLwaeaDH
	fZbPzihtgq2vvjllSBo28BCqLA==
X-Google-Smtp-Source: ABdhPJzZtxkAjlCvb/TUt3cLoRv5l+ol9ToRYGDDMNmm0Vv66uA83/NBrnntGKbTm/BO4hUpHvgFow==
X-Received: by 2002:a05:6512:228d:b0:471:c287:9715 with SMTP id f13-20020a056512228d00b00471c2879715mr3171748lfu.660.1650633881512;
        Fri, 22 Apr 2022 06:24:41 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id w23-20020a197b17000000b0046d1729e7d9sm224621lfc.294.2022.04.22.06.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 06:24:40 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
	id 1CD12104429; Fri, 22 Apr 2022 16:26:19 +0300 (+03)
Date: Fri, 22 Apr 2022 16:26:19 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Borislav Petkov <bp@alien8.de>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Joerg Roedel <jroedel@suse.de>, Ard Biesheuvel <ardb@kernel.org>,
	Andi Kleen <ak@linux.intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Varad Gautam <varad.gautam@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Dave Hansen <dave.hansen@intel.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>, x86@kernel.org,
	linux-mm@kvack.org, linux-coco@lists.linux.dev,
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 3/8] efi/x86: Implement support for unaccepted memory
Message-ID: <20220422132619.54e754fyzeaaoqog@box.shutemov.name>
References: <20220405234343.74045-4-kirill.shutemov@linux.intel.com>
 <Ylnwmvygp796+qcA@zn.tnic>
 <20220418155545.a567xnxa6elglapl@box.shutemov.name>
 <Yl2UHOQ4iZJ29k0q@zn.tnic>
 <20220418202431.whvql4w57c7l5vpw@box.shutemov.name>
 <Yl3RmPhdZieSr8W2@zn.tnic>
 <20220418235015.mnujtlmmlyin7y6m@box.shutemov.name>
 <Yl5nSSC4HpSWqfY7@zn.tnic>
 <20220422002124.lwd7b56zko24gbll@box.shutemov.name>
 <YmJ1o9UmPIW12Nu7@zn.tnic>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmJ1o9UmPIW12Nu7@zn.tnic>

On Fri, Apr 22, 2022 at 11:30:11AM +0200, Borislav Petkov wrote:
> On Fri, Apr 22, 2022 at 03:21:24AM +0300, Kirill A. Shutemov wrote:
> > There's still #include <linux/efi.h> in misc.h. You removed one, but
> > there's a second one for some reason.
> 
> I don't know which tree you're looking at but latest tip/master has:
> 
> $ git grep -E "efi\.h" arch/x86/boot/
> arch/x86/boot/compressed/acpi.c:6:#include "efi.h"
> arch/x86/boot/compressed/kaslr.c:25:#include "efi.h"
> arch/x86/boot/compressed/misc.h:40:#include "efi.h"
> arch/x86/boot/compressed/pgtable_64.c:7:#include "efi.h"

Sorry for the noise. I read 'elf.h' as 'efi.h' :/

But it also includes <linux/bitmap.h> indirectly:

In file included from include/linux/elf.h:6:
In file included from arch/x86/include/asm/elf.h:8:
In file included from include/linux/thread_info.h:60:
In file included from arch/x86/include/asm/thread_info.h:53:
In file included from arch/x86/include/asm/cpufeature.h:5:
In file included from arch/x86/include/asm/processor.h:22:
In file included from arch/x86/include/asm/msr.h:11:
In file included from arch/x86/include/asm/cpumask.h:5:
In file included from include/linux/cpumask.h:12:

> > Any plans for <linux/acpi.h>? It includes <linux/bitmap.h>:
> 
> So if misc.h is including linux/bitmap.h indirectly, you can simply
> include misc.h right?

Yes.

> And then you'll slide under the closing door, as you say below. :)

Is it sarcasm or clearance to go?

> > I also underesitmated what is required to be copied because of the
> > indirect include. The list was only to compile bitmap.c. mem.c (former
> > unaccepted_memory.c) would require more.
> 
> More like?

for_each_clear_bitrange() is pain to unwind.

> Maybe I can help out converting some of the stuff. You could push your
> current state somewhere - even if it doesn't build - so that I can take
> a look...

I will push what I have a bit later today.

> > BTW, do we have a white list of linux/ includes that allowed? minmax.h?
> > math.h? What is the line.
> 
> Well, that's the thing. Even if those look innocuous now, if they get
> new includes added to them, that has an influence on the decompressor.
> 
> So I'm thinking copying the required bits would be the proper way
> forward.

I understand where you comes from. But on my side I face suddenly higher
entry bar. Yes, it is bad excuse, I know.

> > Maybe allow what is included directly or indirectly now? (Yes, it is my
> > poor attempt to slide under closing door.)
> 
> That's basically saying, can I get this done so that I can mark my
> checkbox that my task is done - you can deal with the crap later
> yourself.
> 
> How about we take our time and solve this properly instead of hurrying
> constantly?

I'm okay with this. But I lack coherent understating on how you want it
to look like.

Like, looking on your new "efi.h", I see it still implicitly depends on
<linux/types.h> and <linux/uuid.h>. Why is it okay? Is it temporary? What
is criteria of what is okay to keep for now?

You mentioned having <asm/shared/bitops.h> as we do <asm/shared/io.h>. But
<asm/bitops.h> has non-trivial dependencies on its own.

Okay, we can move them into asm/shared as well, but how to deal with
asm-generic/ things? And linux/ dependencies? Do we create a copy in
x86/include?

-- 
 Kirill A. Shutemov
