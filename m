Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A58B21085
	for <linux-coco@lists.linux.dev>; Thu, 22 Jun 2023 23:39:09 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6b58351327eso112851a34.1
        for <linux-coco@lists.linux.dev>; Thu, 22 Jun 2023 16:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687477148; x=1690069148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VKGNAt/icqKcwe+w9bwI/FB6v+mJ4/WjZdPYohbNbZM=;
        b=cVqJu1OMS7i8yDV5cOeV8SMObfqGmXIDy0gvM0gXduTNRDIfCeyUxAhvcpL1dujfQF
         oFZh6XY2SoTIhec1kQ5ER53lQHciddI4wEalrMNRM3d3DWkpiQgnt8yo1VKZodh6TIlS
         XieNIB/PXCvfpyhLJz55tlo6kYys6FM0Wq8F+3137j/TjVod7lbTZhWDOfCi+vQ4gDyU
         Xl6QLYYaAS00BDZvC1prgQdUD5K4yd1G/zZwO52y9wDmDBiR1W7DaX1ycURJr4dbgjlo
         0v9IZ8EmhT3v+JkG5pPaNxKq2S4vsjx0+FoHnTgktnuBB5SOtF0t5q5fojagagUbD9JQ
         RqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687477148; x=1690069148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKGNAt/icqKcwe+w9bwI/FB6v+mJ4/WjZdPYohbNbZM=;
        b=cbLMrvXrT5Ass4pqPLEyz0tU+ohRktDuZkpJMn2MA0zGx9xZ9TpJbTsrNbN5wEGloK
         wG5U8mxUkt+h52lKLouu931AaJaHZM772sRCExVvmF0rUMWfSJSMXyJ9CC8CuUHEDPJg
         jguQeNgPsYewaqO9okopxXXKKtUwQpwaTluSiTt9FzfKR27dXUG3yT2oa7B3T1ZEajy9
         CILQdYWQHNS4EXC5tG/gDms8+S0ADfqe2JdKzqoIYuIqt2ytKOwu2C/Je4yNPaKWo1mC
         y6Dd3oZV9iMpa1j3TxsmnOqSIY4x1PSP83Bh6v/bV4zt+IGLjzb6g+2BTMo4B5fDTZKx
         kXnQ==
X-Gm-Message-State: AC+VfDwXItMHc+Jb8ULMAXyEVew99Y1Dx9ybo+9qOEf9R2tIlXHjHQ2c
	5sX0ZTiWzG7BW2NaNjHECuI=
X-Google-Smtp-Source: ACHHUZ5/mpehgoqgo5DrR9jrPfIrB1wNcMotJ/HIKpHb5HNxz+eZGJaCXczntz3NIkl5y5Z57vYR4Q==
X-Received: by 2002:a05:6359:67a0:b0:132:ad97:9ca7 with SMTP id sq32-20020a05635967a000b00132ad979ca7mr4719822rwb.12.1687477148331;
        Thu, 22 Jun 2023 16:39:08 -0700 (PDT)
Received: from localhost ([192.55.54.50])
        by smtp.gmail.com with ESMTPSA id s3-20020aa78283000000b0062e0515f020sm4998532pfm.162.2023.06.22.16.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 16:39:07 -0700 (PDT)
Date: Thu, 22 Jun 2023 16:39:06 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: "Huang, Kai" <kai.huang@intel.com>
Cc: "michael.roth@amd.com" <michael.roth@amd.com>,
	"srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>,
	"liam.merwick@oracle.com" <liam.merwick@oracle.com>,
	"tobin@ibm.com" <tobin@ibm.com>,
	"alpergun@google.com" <alpergun@google.com>,
	"Luck, Tony" <tony.luck@intel.com>,
	"jmattson@google.com" <jmattson@google.com>,
	"Lutomirski, Andy" <luto@kernel.org>,
	"ak@linux.intel.com" <ak@linux.intel.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"slp@redhat.com" <slp@redhat.com>,
	"dovmurik@linux.ibm.com" <dovmurik@linux.ibm.com>,
	"Wang, Zhi A" <zhi.a.wang@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"pgonda@google.com" <pgonda@google.com>,
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
	"rientjes@google.com" <rientjes@google.com>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"x86@kernel.org" <x86@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
	"Annapurve, Vishal" <vannapurve@google.com>,
	"dgilbert@redhat.com" <dgilbert@redhat.com>,
	"Christopherson,, Sean" <seanjc@google.com>,
	"vkuznets@redhat.com" <vkuznets@redhat.com>,
	"marcorr@google.com" <marcorr@google.com>,
	"vbabka@suse.cz" <vbabka@suse.cz>,
	"ashish.kalra@amd.com" <ashish.kalra@amd.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"nikunj.dadhania@amd.com" <nikunj.dadhania@amd.com>,
	"Rodel, Jorg" <jroedel@suse.de>,
	"isaku.yamahata@gmail.com" <isaku.yamahata@gmail.com>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>,
	"kirill@shutemov.name" <kirill@shutemov.name>,
	"jarkko@kernel.org" <jarkko@kernel.org>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"ardb@kernel.org" <ardb@kernel.org>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Subject: Re: [PATCH RFC v9 04/51] KVM: x86: Determine shared/private faults
 using a configurable mask
Message-ID: <20230622233906.GA3436214@ls.amr.corp.intel.com>
References: <20230612042559.375660-1-michael.roth@amd.com>
 <20230612042559.375660-5-michael.roth@amd.com>
 <20230614164709.GT2244082@ls.amr.corp.intel.com>
 <20230620202841.7qizls3u3kcck45g@amd.com>
 <20230620211845.GV2244082@ls.amr.corp.intel.com>
 <20230621230031.37hdnymbjzwjgbo2@amd.com>
 <c116b7ab8ca02116f2b8d19a8214161c3b30576c.camel@intel.com>
 <20230622153229.vjkrzi6rgiolstns@amd.com>
 <25037dfe969698dd109daee8c6dbe0d08a874a08.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <25037dfe969698dd109daee8c6dbe0d08a874a08.camel@intel.com>

On Thu, Jun 22, 2023 at 10:31:08PM +0000,
"Huang, Kai" <kai.huang@intel.com> wrote:

> > If there are better ways to handle *how*
> > that's done I don't have any complaints there, but moving/adding bits
> > to GPA/error_flags after fault time just seems unecessary to me when
> > fault->is_private field can serve that purpose just as well.
> 
> Perhaps you missed my point.  My point is arch.mmu_private_fault_mask and
> arch.gfn_shared_mask seem redundant because the logic around them are exactly
> the same.  I do believe we should have fault->is_private passing to the common
> MMU code.
> 
> In fact, now I am wondering why we need to have "mmu_private_fault_mask" and
> "gfn_shared_mask" in _common_ KVM MMU code.  We already have enough mechanism in
> KVM common code:
> 
>   1) fault->is_private
>   2) kvm_mmu_page_role.private
>   3) an Xarray to tell whether a GFN is private or shared
> 
> I am not convinced that we need to have "mmu_private_fault_mask" and
> "gfn_shared_mask" in common KVM MMU code.  Instead, they can be in AMD and
> Intel's vendor code.
> 
> Maybe it makes sense to have "gfn_shared_mask" in the KVM common code so that
> the fault handler can just strip away the "shared bit" at the very beginning (at
> least for TDX), but for the rest of the time I think we should already have
> enough infrastructure to handle private/shared mapping.
> 
> Btw, one minor issue is, if I recall correctly, for TDX the shared bit must be
> applied to the GFN for shared mapping in normal EPT.  I guess AMD doesn't need
> that for shared mapping.  So "gfn_shared_mask" maybe useful in this case, but
> w/o it I believe we can also achieve in another way via vendor callback.


"2) kvm_mmu_page_role.private" above has different meaning.

a). The fault is private or not.
b). page table the fault handler is walking is private or conventional.

a.) is common for SNP, TDX and PROTECTED_VM. It makes sense in
kvm_mmu_do_page_fault() and __kvm_faultin_pfn(). After kvm_faultin_pfn(), the
fault handler can mostly forget it for SNP and PROTECTED_VM. (large page
adjustment needs it, though.) This is what we're discussing in this thread.

b.) is specific to TDX. TDX KVM MMU introduces one more page table.

-- 
Isaku Yamahata <isaku.yamahata@gmail.com>
