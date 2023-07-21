Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CF927F1D
	for <linux-coco@lists.linux.dev>; Fri, 21 Jul 2023 18:43:46 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1b89e10d356so15270005ad.3
        for <linux-coco@lists.linux.dev>; Fri, 21 Jul 2023 11:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689965026; x=1690569826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4nnFaTg0IEjUdqid4XZGgfvzwMzdJISJ9KdbrEVQTkc=;
        b=gN5kqHrGUQ7n9A2IeKWEWJ79xju2TNQX6vnpuKuZ1IIfSnrVMexOaclUCgl5XYI9UC
         OWPJHMSRSLPOGuaQWwrdrDQpOz4lZbiGO4EDZEZFsRy2fKyNf1F4NSOoFAT9F++Z5YSb
         u7LZC4s4ZsvhlVum6sFEBuyYQhvICSQiXffsFPFg6/JGW8VM7U3sSg04VvRy6I/EO+3P
         t34xJxkkxkqevGIeHS3k27dcjQk6GOZUsQmCoPUquHRxofwbxHd+jJVs3J4Kw8dEU/Gt
         q3MgPq8O7i2YnhPyD/3i/vJhyisTQ/eGAqbmO+WEfT8YSL9kAWHbe56GP5DC6qpaA/FQ
         cVJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689965026; x=1690569826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4nnFaTg0IEjUdqid4XZGgfvzwMzdJISJ9KdbrEVQTkc=;
        b=kGV4XhJDHcowa9i91AfbRMuwnu0cvL0wR3ebb8Rx8xYcBdlBYLDuEFNEM4GyrPJelO
         4ZGwZGKv5pxCLUwFYyVcqla49jgB3uuCWtMQoHbgcNV+/omUgk3tzJORfS59JjDRHppO
         6RKfSjd3KtvfOFld+Zw2cxh1d3tjnF/1pKVFmd3L2jVIxPHj3Ir22p+kT2da/zzAQrFk
         gUEPDlBZTRYRa3zkwFE/2QHdxrW0nAnHJhoJUhWfj6iRYd+hyHw9tmCdGhJmSZ/r8Sf/
         Vur/9cNUTrMN2qdEb8zeXi1lRxaJVa1401RLNfuiyNQ5lL/3ozCgXntAntM8y6+/Clak
         stnA==
X-Gm-Message-State: ABy/qLbzz/r9pQffiACNvjgs1O/zs2S76bYnylLQCQCmLgTyJGvKBygg
	r2v+BUR33Dnl1+iGwjEZPy8=
X-Google-Smtp-Source: APBJJlHWZaBoDL8lz8FffqgAybCoIF1obzSq2tHKJzpNUhRlifDbg57zIVf8dPuxHagjKCnBWSip6w==
X-Received: by 2002:a17:902:7c85:b0:1b7:c166:f197 with SMTP id y5-20020a1709027c8500b001b7c166f197mr2272527pll.29.1689965025944;
        Fri, 21 Jul 2023 11:43:45 -0700 (PDT)
Received: from localhost ([192.55.54.50])
        by smtp.gmail.com with ESMTPSA id l1-20020a170903244100b001b3fb2f0296sm3848573pls.120.2023.07.21.11.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 11:43:45 -0700 (PDT)
Date: Fri, 21 Jul 2023 11:43:43 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Sean Christopherson <seanjc@google.com>
Cc: isaku.yamahata@intel.com, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, isaku.yamahata@gmail.com,
	Michael Roth <michael.roth@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>, erdemaktas@google.com,
	Sagi Shahar <sagis@google.com>, David Matlack <dmatlack@google.com>,
	Kai Huang <kai.huang@intel.com>,
	Zhi Wang <zhi.wang.linux@gmail.com>, chen.bo@intel.com,
	linux-coco@lists.linux.dev, Chao Peng <chao.p.peng@linux.intel.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Vishal Annapurve <vannapurve@google.com>,
	Yuan Yao <yuan.yao@linux.intel.com>
Subject: Re: [RFC PATCH v4 09/10] KVM: x86: Make struct sev_cmd common for
 KVM_MEM_ENC_OP
Message-ID: <20230721184343.GI25699@ls.amr.corp.intel.com>
References: <cover.1689893403.git.isaku.yamahata@intel.com>
 <8c0b7babbdd777a33acd4f6b0f831ae838037806.1689893403.git.isaku.yamahata@intel.com>
 <ZLqbWFnm7jyB8JuY@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZLqbWFnm7jyB8JuY@google.com>

On Fri, Jul 21, 2023 at 07:51:04AM -0700,
Sean Christopherson <seanjc@google.com> wrote:

> On Thu, Jul 20, 2023, isaku.yamahata@intel.com wrote:
> > diff --git a/arch/x86/include/uapi/asm/kvm.h b/arch/x86/include/uapi/asm/kvm.h
> > index aa7a56a47564..32883e520b00 100644
> > --- a/arch/x86/include/uapi/asm/kvm.h
> > +++ b/arch/x86/include/uapi/asm/kvm.h
> > @@ -562,6 +562,39 @@ struct kvm_pmu_event_filter {
> >  /* x86-specific KVM_EXIT_HYPERCALL flags. */
> >  #define KVM_EXIT_HYPERCALL_LONG_MODE	BIT(0)
> >  
> > +struct kvm_mem_enc_cmd {
> > +	/* sub-command id of KVM_MEM_ENC_OP. */
> > +	__u32 id;
> > +	/*
> > +	 * Auxiliary flags for sub-command.  If sub-command doesn't use it,
> > +	 * set zero.
> > +	 */
> > +	__u32 flags;
> > +	/*
> > +	 * Data for sub-command.  An immediate or a pointer to the actual
> > +	 * data in process virtual address.  If sub-command doesn't use it,
> > +	 * set zero.
> > +	 */
> > +	__u64 data;
> > +	/*
> > +	 * Supplemental error code in the case of error.
> > +	 * SEV error code from the PSP or TDX SEAMCALL status code.
> > +	 * The caller should set zero.
> > +	 */
> > +	union {
> > +		struct {
> > +			__u32 error;
> > +			/*
> > +			 * KVM_SEV_LAUNCH_START and KVM_SEV_RECEIVE_START
> > +			 * require extra data. Not included in struct
> > +			 * kvm_sev_launch_start or struct kvm_sev_receive_start.
> > +			 */
> > +			__u32 sev_fd;
> > +		};
> > +		__u64 error64;
> > +	};
> > +};
> 
> Eww.  Why not just use an entirely different struct for TDX?  I don't see what
> benefit this provides other than a warm fuzzy feeling that TDX and SEV share a
> struct.  Practically speaking, KVM will likely take on more work to forcefully
> smush the two together than if they're separate things.

Ok, let's drop this patch. Keep the ABI different for now.
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>
