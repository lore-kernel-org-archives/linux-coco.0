Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C627C
	for <linux-coco@lists.linux.dev>; Thu, 27 Jul 2023 00:38:01 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1b8b4748fe4so2802145ad.1
        for <linux-coco@lists.linux.dev>; Wed, 26 Jul 2023 17:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690418281; x=1691023081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ATN7YAlsVZEJporVO50g2aQeIWoActMrVk97ztgwhKo=;
        b=mEHu84UG0JCx6PjN43cEokYue0X1BsIq+1lT8qqreA9qCCoE85OhqPIA1n32XncHLo
         mlm7TypRofs/9imuJukupCkb5MRl7l/1D5FNTZhsFMvsKMFsEgr9Jt320+d1f9y2g/0P
         DpZAMd4fsdp8KbTPipAK+517AVyGB41Qob1yp83ldlFI01GjW1uaBjHzcVkEffI4Opnb
         yvvRenDe26KN9bVJ1RM9i/wuN2OdKn2aBGToVcSsggYJ6aHJdc73/TYJgrbfQYFNXGtr
         VdoWgdeOYY6g9WreuXQLIBAPG8I7ZdS48DO0pGgcWeraQ6tFjuIJ3v+X1jgKjRxlv+WY
         Xk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690418281; x=1691023081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ATN7YAlsVZEJporVO50g2aQeIWoActMrVk97ztgwhKo=;
        b=eHd+aoJ/zCYSaa7/dN2rQh9tSoP3LCB8J5aYoypbeUDEbsxdrkR9+39Ehx/exlEivL
         oYpvSb8bjjVJq+x+9ShfjHVwEUYF1cOWNF/LeabV1pQb1DVADaEIH3HgAQr6F92Fb+7k
         lkq2wjtz9pFN81nNqXGHouu6F/aqOQ5vSkicS4SN4mrPtEg9rqOgv26xT9rxvc6G07u4
         i2Qmos23u2cgedB8SmaGbKLJTcvE7vegxAQxvdXorRQWMsQKFHGABcvwtStt7JViqnQ+
         OTi9z0bc8veU1MNZ5yZgcF8y6KRYfnEHHcANcuu003pod6W63vLWDNOQLwnA3/AwjlDo
         Hcig==
X-Gm-Message-State: ABy/qLZ8Giwej4MfJbeErlkUpOIRvNV7pZaA7gFGwx98sXClYlwz56JB
	RZphpvRxefSjP52Mu6HPyfg=
X-Google-Smtp-Source: APBJJlGqM1dx3AW8MZ9SKEPfOeMJLPVLdXzJ8/yaPStsQ8rRnWHSGj8+BHndAGRWRU0M6kZaxA9B1A==
X-Received: by 2002:a17:902:d2cc:b0:1bb:dc48:644a with SMTP id n12-20020a170902d2cc00b001bbdc48644amr395035plc.49.1690418280789;
        Wed, 26 Jul 2023 17:38:00 -0700 (PDT)
Received: from localhost ([192.55.54.50])
        by smtp.gmail.com with ESMTPSA id jh3-20020a170903328300b001b50cbc0b4fsm161140plb.111.2023.07.26.17.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 17:38:00 -0700 (PDT)
Date: Wed, 26 Jul 2023 17:37:59 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, isaku.yamahata@intel.com,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	isaku.yamahata@gmail.com, Michael Roth <michael.roth@amd.com>,
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
Message-ID: <20230727003759.GA2021422@ls.amr.corp.intel.com>
References: <cover.1689893403.git.isaku.yamahata@intel.com>
 <8c0b7babbdd777a33acd4f6b0f831ae838037806.1689893403.git.isaku.yamahata@intel.com>
 <ZLqbWFnm7jyB8JuY@google.com>
 <9e8a98ad-1f8d-a09c-3173-71c5c3ab5ed4@intel.com>
 <ZL/r6Vca8WkFVaic@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZL/r6Vca8WkFVaic@google.com>

On Tue, Jul 25, 2023 at 08:36:09AM -0700,
Sean Christopherson <seanjc@google.com> wrote:

> On Tue, Jul 25, 2023, Xiaoyao Li wrote:
> > On 7/21/2023 10:51 PM, Sean Christopherson wrote:
> > > On Thu, Jul 20, 2023, isaku.yamahata@intel.com wrote:
> > > > diff --git a/arch/x86/include/uapi/asm/kvm.h b/arch/x86/include/uapi/asm/kvm.h
> > > > index aa7a56a47564..32883e520b00 100644
> > > > --- a/arch/x86/include/uapi/asm/kvm.h
> > > > +++ b/arch/x86/include/uapi/asm/kvm.h
> > > > @@ -562,6 +562,39 @@ struct kvm_pmu_event_filter {
> > > >   /* x86-specific KVM_EXIT_HYPERCALL flags. */
> > > >   #define KVM_EXIT_HYPERCALL_LONG_MODE	BIT(0)
> > > > +struct kvm_mem_enc_cmd {
> > > > +	/* sub-command id of KVM_MEM_ENC_OP. */
> > > > +	__u32 id;
> > > > +	/*
> > > > +	 * Auxiliary flags for sub-command.  If sub-command doesn't use it,
> > > > +	 * set zero.
> > > > +	 */
> > > > +	__u32 flags;
> > > > +	/*
> > > > +	 * Data for sub-command.  An immediate or a pointer to the actual
> > > > +	 * data in process virtual address.  If sub-command doesn't use it,
> > > > +	 * set zero.
> > > > +	 */
> > > > +	__u64 data;
> > > > +	/*
> > > > +	 * Supplemental error code in the case of error.
> > > > +	 * SEV error code from the PSP or TDX SEAMCALL status code.
> > > > +	 * The caller should set zero.
> > > > +	 */
> > > > +	union {
> > > > +		struct {
> > > > +			__u32 error;
> > > > +			/*
> > > > +			 * KVM_SEV_LAUNCH_START and KVM_SEV_RECEIVE_START
> > > > +			 * require extra data. Not included in struct
> > > > +			 * kvm_sev_launch_start or struct kvm_sev_receive_start.
> > > > +			 */
> > > > +			__u32 sev_fd;
> > > > +		};
> > > > +		__u64 error64;
> > > > +	};
> > > > +};
> > > 
> > > Eww.  Why not just use an entirely different struct for TDX?  I don't see what
> > > benefit this provides other than a warm fuzzy feeling that TDX and SEV share a
> > > struct.  Practically speaking, KVM will likely take on more work to forcefully
> > > smush the two together than if they're separate things.
> > 
> > generalizing the struct of KVM_MEM_ENC_OP should be the first step.
> 
> It's not just the one structure though.  The "data" field is a pointer to yet
> another layer of commands, and SEV has a rather big pile of those.  Making
> kvm_mem_enc_cmd common is just putting lipstick on a pig since the vast majority
> of the structures associated with the ioctl() would still be vendor specific.

>   struct kvm_sev_launch_start
>   struct kvm_sev_launch_update_data
>   struct kvm_sev_launch_secret
>   struct kvm_sev_launch_measure
>   struct kvm_sev_guest_status
>   struct kvm_sev_dbg
>   struct kvm_sev_attestation_report
>   struct kvm_sev_send_start
>   struct kvm_sev_send_update_data
>   struct kvm_sev_receive_start
>   struct kvm_sev_receive_update_data
> 
> FWIW, I really dislike KVM's uAPI for KVM_MEM_ENC_OP.  The above structures are
> all basically copied verbatim from PSP firmware structures, i.e. the commands and
> their payloads are tightly coupled to "hardware" and essentially have no abstraction
> whatsoever.   But that ship has already sailed, and practically speaking trying to
> provide a layer of abstraction might not of worked very well anyways.
> 
> In other words, unless there's an obvious and easy way path to convergence, I
> recommend you don't spend much time/effort on trying to share code with TDX.

I think we can easily unify vcpu initialization, populating/measure initial
memory, completing guest creation, and guest memory access for debug.

KVM_SEV_LAUNCH_UPDATE_VMSA <-> KVM_TDX_INIT_VCPU
KVM_SEV_LAUNCH_UPDATE_DATA and KVM_SEV_LAUNCH_MEASURE <-> KVM_INIT_MEM_REGION
KVM_SEV_LAUNCH_FINISH <-> KVM_TDX_FINALIZE_VM
KVM_SEV_DBG_DECRYPT, KVM_SEV_DBG_ENCRYPT: KVM common API for access protected guest memory


Here's my assessment. For now I don't address migration.

For creating confidential guest:

- Get the capability of underlying platform
  KVM_TDX_CAPABILITY: no sev correspondence.

- Initialize VM as confidential VM
  struct kvm_sev_launch_start
  KVM_SEV{,_ES}_INIT, and KVM_SEV_LAUNCH_START:
  KVM_TDX_INIT_VM
  They take vendor specific data.


- Initialize vcpu
  KVM_SEV_LAUNCH_UPDATE_VMSA: no extra argument
  KVM_TDX_INIT_VCPU:          no extra argument


- populate initial memory + measurement
  KVM_SEV_LAUNCH_UPDATE_DATA and KVM_SEV_LAUNCH_MEASURE,
  struct kvm_sev_launch_update_data {
        __u64 uaddr;
        __u32 len;
  };
  struct kvm_sev_launch_measure {
        __u64 uaddr;
        __u32 len;
  };
  => GPA is calculated from uaddr.

  KVM_INIT_MEM_REGION:
  struct kvm_tdx_init_mem_region {
        __u64 source_addr;      // uaddr
        __u64 gpa;
        __u64 nr_pages;
  };

  I think those can same structure. Or prefault or prepopulating
  e.g.
  struct {
        __u64 uaddr;
        __u64 gpa;
        __u64 len;
  #define FLAG_MEASURE    BIT(0)
  #define FLAG_GPA        BIT(1)  // GPA is valid or calculated from uaddr
        __u64 flags;
  };
  

- Complete initialization. Make the guest ready to run vcpu
  KVM_SEV_LAUNCH_FINISH: no argument
  KVM_TDX_FINALIZE_VM:   no argument

- KVM_SEV_LAUNCH_SECRET: no TDX correspondence
  struct kvm_sev_launch_secret


For guest debug

- KVM_SEV_DBG_DECRYPT, KVM_SEV_DBG_ENCRYPT: struct kvm_sev_dbg
  This is to read/write guest memory for debug. We can easily have a common
  API.

- KVM_SEV_GUEST_STATUS
  struct kvm_sev_guest_status
  No TDX correspondence

Thanks,
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>
