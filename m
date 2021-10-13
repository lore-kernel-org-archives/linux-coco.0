Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB1F2C83
	for <linux-coco@lists.linux.dev>; Wed, 13 Oct 2021 21:23:09 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id ls18-20020a17090b351200b001a00250584aso5396721pjb.4
        for <linux-coco@lists.linux.dev>; Wed, 13 Oct 2021 14:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jJvcs17LLVFEQhgYWiSuKw3a7LUuxCQxSGq7VTL24ss=;
        b=YgR3hhIUzzM3MmB/VqCp5RF1lyCBvwRrbqY6X36NmMS5JkVl3bwQO5XZTIrKqSqpQL
         nU/XHW3zmal1getVVHqEBwvdmoxMZH6gtYctnZhb9aC6o5In2TIYlj7SOlQW93VIMfcc
         pC1BcIUjIz6qn/eZmMybLYpJHP7nZKwSpRCYoCslShBF/b8DQi//NBPTQ/g4m4dgEIOp
         75uc6tqFBgYWKq0pKycSl9qygSI3Ap+f3B3VN2lvZPN17V/of6FzkX6KFwKoIMSmU/f0
         ATq7U4ALPcWbykyiTNdSSkYBi4cb8uKCPL2efB3rojmfYwG5o6gGE0OmSXmzBWvL15Mb
         ZODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jJvcs17LLVFEQhgYWiSuKw3a7LUuxCQxSGq7VTL24ss=;
        b=1rUp1kxC141r5Sg/BK3z+SHStZ52JQaPbNbpYlfeTpLUpLADcPvAH01v1MzqwkuGK/
         Rrw2Rhafia2/Vnip3iqa8WCcWE/SZfIlX0IzGPeLED3g0sza3lF/2dyk+9wkHrIORrro
         yNzg5GRTFeiy0QiVMSkewBjpVOShEdDhuhFw8MebKCsV6gAspsVAuMZvccYj290TgoJa
         PHacdcfblySyqKCBCp0psOwZFprqV667lPCdCoqH1eDl36IRmrUNHxZijLWYh4s2EUp+
         K01yruMiFWSW4BjEIAVcOjy0TeP9iLwq4zxQAr3PkxSoaLayF3A5ig+rQzzI1/arih/3
         ZTmA==
X-Gm-Message-State: AOAM530dUOqqzqPUVPF61XrgbWWHzmgChXfj+8ygupA+zEp/1/PCIiN4
	PsW9y0e0r8LR1A7f1u2TVXtwvA==
X-Google-Smtp-Source: ABdhPJw2M6O5Yc3sL2L0DOrlSc3azMTGw+iud61+sJ6lIpuqStpgI3xY9tPsA1NcNb6zm+oeFxyRcg==
X-Received: by 2002:a17:90b:1041:: with SMTP id gq1mr1854168pjb.31.1634160188901;
        Wed, 13 Oct 2021 14:23:08 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id 21sm6804567pjg.57.2021.10.13.14.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 14:23:08 -0700 (PDT)
Date: Wed, 13 Oct 2021 21:23:02 +0000
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
	marcorr@google.com, sathyanarayanan.kuppuswamy@linux.intel.com,
	stable@kernel.org
Subject: Re: [PATCH Part2 v5 33/45] KVM: x86: Update page-fault trace to log
 full 64-bit error code
Message-ID: <YWdONpbG9xg3p77C@google.com>
References: <20210820155918.7518-1-brijesh.singh@amd.com>
 <20210820155918.7518-34-brijesh.singh@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210820155918.7518-34-brijesh.singh@amd.com>

On Fri, Aug 20, 2021, Brijesh Singh wrote:
> The #NPT error code is a 64-bit value but the trace prints only the
> lower 32-bits. Some of the fault error code (e.g PFERR_GUEST_FINAL_MASK)
> are available in the upper 32-bits.
> 
> Cc: <stable@kernel.org>
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> ---

Reviewed-by: Sean Christopherson <seanjc@google.com>

Paolo, can you grab this one sooner than later?  Alternatively, maybe post this
separately Brijesh?
