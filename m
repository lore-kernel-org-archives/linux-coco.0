Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872C52C82
	for <linux-coco@lists.linux.dev>; Fri, 15 Oct 2021 16:44:07 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id y7so8822914pfg.8
        for <linux-coco@lists.linux.dev>; Fri, 15 Oct 2021 09:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zSHOcs5t+6dTQwUxuGH/T7ott4w7EhNYJHh3Z2GocjA=;
        b=AIhx2i9vMNxJmE3uzyIojUAXtN7O9RaN/DTCaA0s69W6dr/F02lHnP46eAy1BAczkS
         q/3YYgROnZDdu5KCTulYeoTevurQP6Gw5YJGpPrpkCXsWSaAG/7Dih1O8GYvfBoti6ih
         kWI3J8o2p5RY4iOXrGsIDYzHDgFP2sUvsa2EIaEjcIgIwtaQ4NTbC8eQrJm1x3x3O5im
         YMvd241FxnNuepC7dK1eisKKJKQ1BpEAqBI/BIduLf6/9f4tVUulzs16bdEq/8dAKwNO
         viQuoJJMMY0w+TJ+XEfkw8zNkCYHm85q8evdIoeYwNcXPQO/lnBVnHZmNXVduzKXLEZ2
         LbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zSHOcs5t+6dTQwUxuGH/T7ott4w7EhNYJHh3Z2GocjA=;
        b=Vi9rrj8RsH1VI3UPHncBX+hLdaMfvclch/AerQxfNjlHZMvt5c/pEbElqRlpE5kf5N
         PJ9pwR8EW/MHGulas2ummmSLegnKJiqTvcnI444UI1Mgxq9YvTC+YJXoJc77gmfB/0Wb
         C1jv5+CSas14ntjvt6j8oJwNqWAWq16kouJ27bo3uBaKyPibkCPKdestZ+XopdQF9Pir
         wGweo5ggjVZosd72nXLiespi4YoiuuimhAa7uJ44MdFmo0aHqZB5mokSzTKDG9uW1Pas
         lU7nl4XMJhRV3h7WRG74/XdeX6ll5uwx5DZwg1Sq72fxOHdK3C56qOaEpIWlKySTwfdM
         Z0sw==
X-Gm-Message-State: AOAM532dymbMD1apyfiK7BgX1K7cV9jFAojFlx4xxxMl/oszvbkFAYT5
	K/UZPtO0XluAP0k5an+7lMy0OQ==
X-Google-Smtp-Source: ABdhPJxtVTeCPQ5dOb7/w00ASS1IRHqKuVloMz2UwAfLuAU9TDr2EVBRJZOlG0vE0DE86rBAGM7T6w==
X-Received: by 2002:a63:e613:: with SMTP id g19mr10102661pgh.12.1634316246676;
        Fri, 15 Oct 2021 09:44:06 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id o14sm5451095pfh.84.2021.10.15.09.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 09:44:06 -0700 (PDT)
Date: Fri, 15 Oct 2021 16:44:02 +0000
From: Sean Christopherson <seanjc@google.com>
To: Brijesh Singh <brijesh.singh@amd.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-mm@kvack.org,
	linux-crypto@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sergio Lopez <slp@redhat.com>, Peter Gonda <pgonda@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	David Rientjes <rientjes@google.com>,
	Dov Murik <dovmurik@linux.ibm.com>,
	Tobin Feldman-Fitzthum <tobin@ibm.com>,
	Borislav Petkov <bp@alien8.de>, Michael Roth <michael.roth@amd.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Andi Kleen <ak@linux.intel.com>, tony.luck@intel.com,
	marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com
Subject: Re: [PATCH Part2 v5 34/45] KVM: SVM: Do not use long-lived GHCB map
 while setting scratch area
Message-ID: <YWmv0uerMuujn/Wo@google.com>
References: <20210820155918.7518-1-brijesh.singh@amd.com>
 <20210820155918.7518-35-brijesh.singh@amd.com>
 <YWdNisk78f5BVNv3@google.com>
 <fb6e3800-7eaf-868d-365a-9b76665bd06c@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb6e3800-7eaf-868d-365a-9b76665bd06c@amd.com>

On Fri, Oct 15, 2021, Brijesh Singh wrote:
> 
> On 10/13/21 2:20 PM, Sean Christopherson wrote:
> > On Fri, Aug 20, 2021, Brijesh Singh wrote:
> >> The setup_vmgexit_scratch() function may rely on a long-lived GHCB
> >> mapping if the GHCB shared buffer area was used for the scratch area.
> >> In preparation for eliminating the long-lived GHCB mapping, always
> >> allocate a buffer for the scratch area so it can be accessed without
> >> the GHCB mapping.
> > Would it make sense to post this patch and the next (Remove the long-lived GHCB
> > host map) in a separate mini-series?  It's needed for SNP, but AFAICT there's
> > nothing that depends on SNP.  Getting this merged ahead of time would reduce the
> > size of the SNP series by a smidge.
> 
> While testing with random configs, I am seeing some might_sleep() warns.
> This is happening mainly because during the vmrun the GHCB is accessed
> with preempt disabled. The kvm_vcpu_map() -> kmap() reports the warning.
> I am leaning towards creating a cache on the vmgexit and use that cache
> instead of the doing a kmap() on every access. Does that sound okay to you ?

Since SEV is 64-bit only, it should be ok to add a kvm_vcpu_map_atomic() variant.
