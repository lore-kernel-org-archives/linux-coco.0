Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634991F173
	for <linux-coco@lists.linux.dev>; Tue, 25 Jul 2023 15:36:12 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-583a4015791so44335227b3.1
        for <linux-coco@lists.linux.dev>; Tue, 25 Jul 2023 08:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690299371; x=1690904171;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zJL188spEdf8jlBHFLQkEZlti0TXRFH+U5cu91h9YR8=;
        b=SQwtCbchLJBC6JVt0au7UKzD6DauTBO7Ht/6fLayaAtmMn1ddu11cTpSkwaJcaV44a
         NWDLUE0AHkMJ4OT/Wo7KKa/YKEmgrg0sjWJQN5tC7BKxnoeKzmpoqnaHQej2Uu5AZKaU
         MvfCkMQ/9S4mtrQujLRuCkTF6VGlYXZv0SHwd9+lehD/ByMW+ku5ouyZWo63QG79Jti3
         dL/iU2UqJCVbtC1Tx31JmqLDfUvOX+276nwpWwK0qsvBNUuQKVklM8KpdqkZ/6XnBUk1
         1RvPq2UqE4epZmu8AYwV6Qsx5xkIVtSB41MiB+RgQ3vXNb1HvKO7/DjgvM5UJNPUqDWt
         qGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690299371; x=1690904171;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zJL188spEdf8jlBHFLQkEZlti0TXRFH+U5cu91h9YR8=;
        b=YP54AIELtL3XBkx1SW9xilalEDgYcdT/ZMlIZBOg/jOhow+eRDgSX8lqtK6/UVi8Nl
         RikTH5Nx8iAbzKHkDmUipCzW0rGE1CuMf3G3GlKxjpzq9aPqkbY4DeYRaIL9lbu5nsMv
         N4vcqhQqCxfc/HPU/lEs9eZVxuDvT6ESl6qLOY7nes1Ukmnj9O5nTpn3Nq+/6luz0ZZm
         hyaH7jmakHTjj7iClOLkkeU5A8/r93zSfx9Xp1oZJSaNI2+XPs7300Oh9bb8cHxELsJ6
         xSDjHXb+uny3D6eFCqKYKOgwK7nX0T3j4aZkB3UnIbpB8ndE/vml4sN0XizBz8uo71ou
         5Jvg==
X-Gm-Message-State: ABy/qLaMdVENIC/ZglclFgtJpIW14aQHzBNdoTSDtk+/sRJxEVgcHVk5
	R6w5mdJlnqK8PfQir8wX1clxi2Dxd6s=
X-Google-Smtp-Source: APBJJlFhPr4toDReLY5Gy5S9qrHXSfoNM086H5vUdRAYxVSKWKJsBx2ZDiNmzQUckTY/qbAOmAb98eQVxVA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:af21:0:b0:56c:e585:8b17 with SMTP id
 n33-20020a81af21000000b0056ce5858b17mr89738ywh.5.1690299371207; Tue, 25 Jul
 2023 08:36:11 -0700 (PDT)
Date: Tue, 25 Jul 2023 08:36:09 -0700
In-Reply-To: <9e8a98ad-1f8d-a09c-3173-71c5c3ab5ed4@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1689893403.git.isaku.yamahata@intel.com>
 <8c0b7babbdd777a33acd4f6b0f831ae838037806.1689893403.git.isaku.yamahata@intel.com>
 <ZLqbWFnm7jyB8JuY@google.com> <9e8a98ad-1f8d-a09c-3173-71c5c3ab5ed4@intel.com>
Message-ID: <ZL/r6Vca8WkFVaic@google.com>
Subject: Re: [RFC PATCH v4 09/10] KVM: x86: Make struct sev_cmd common for KVM_MEM_ENC_OP
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: isaku.yamahata@intel.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, isaku.yamahata@gmail.com, 
	Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, erdemaktas@google.com, 
	Sagi Shahar <sagis@google.com>, David Matlack <dmatlack@google.com>, Kai Huang <kai.huang@intel.com>, 
	Zhi Wang <zhi.wang.linux@gmail.com>, chen.bo@intel.com, linux-coco@lists.linux.dev, 
	Chao Peng <chao.p.peng@linux.intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Yuan Yao <yuan.yao@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Jul 25, 2023, Xiaoyao Li wrote:
> On 7/21/2023 10:51 PM, Sean Christopherson wrote:
> > On Thu, Jul 20, 2023, isaku.yamahata@intel.com wrote:
> > > diff --git a/arch/x86/include/uapi/asm/kvm.h b/arch/x86/include/uapi/asm/kvm.h
> > > index aa7a56a47564..32883e520b00 100644
> > > --- a/arch/x86/include/uapi/asm/kvm.h
> > > +++ b/arch/x86/include/uapi/asm/kvm.h
> > > @@ -562,6 +562,39 @@ struct kvm_pmu_event_filter {
> > >   /* x86-specific KVM_EXIT_HYPERCALL flags. */
> > >   #define KVM_EXIT_HYPERCALL_LONG_MODE	BIT(0)
> > > +struct kvm_mem_enc_cmd {
> > > +	/* sub-command id of KVM_MEM_ENC_OP. */
> > > +	__u32 id;
> > > +	/*
> > > +	 * Auxiliary flags for sub-command.  If sub-command doesn't use it,
> > > +	 * set zero.
> > > +	 */
> > > +	__u32 flags;
> > > +	/*
> > > +	 * Data for sub-command.  An immediate or a pointer to the actual
> > > +	 * data in process virtual address.  If sub-command doesn't use it,
> > > +	 * set zero.
> > > +	 */
> > > +	__u64 data;
> > > +	/*
> > > +	 * Supplemental error code in the case of error.
> > > +	 * SEV error code from the PSP or TDX SEAMCALL status code.
> > > +	 * The caller should set zero.
> > > +	 */
> > > +	union {
> > > +		struct {
> > > +			__u32 error;
> > > +			/*
> > > +			 * KVM_SEV_LAUNCH_START and KVM_SEV_RECEIVE_START
> > > +			 * require extra data. Not included in struct
> > > +			 * kvm_sev_launch_start or struct kvm_sev_receive_start.
> > > +			 */
> > > +			__u32 sev_fd;
> > > +		};
> > > +		__u64 error64;
> > > +	};
> > > +};
> > 
> > Eww.  Why not just use an entirely different struct for TDX?  I don't see what
> > benefit this provides other than a warm fuzzy feeling that TDX and SEV share a
> > struct.  Practically speaking, KVM will likely take on more work to forcefully
> > smush the two together than if they're separate things.
> 
> generalizing the struct of KVM_MEM_ENC_OP should be the first step.

It's not just the one structure though.  The "data" field is a pointer to yet
another layer of commands, and SEV has a rather big pile of those.  Making
kvm_mem_enc_cmd common is just putting lipstick on a pig since the vast majority
of the structures associated with the ioctl() would still be vendor specific.

  struct kvm_sev_launch_start
  struct kvm_sev_launch_update_data
  struct kvm_sev_launch_secret
  struct kvm_sev_launch_measure
  struct kvm_sev_guest_status
  struct kvm_sev_dbg
  struct kvm_sev_attestation_report
  struct kvm_sev_send_start
  struct kvm_sev_send_update_data
  struct kvm_sev_receive_start
  struct kvm_sev_receive_update_data

FWIW, I really dislike KVM's uAPI for KVM_MEM_ENC_OP.  The above structures are
all basically copied verbatim from PSP firmware structures, i.e. the commands and
their payloads are tightly coupled to "hardware" and essentially have no abstraction
whatsoever.   But that ship has already sailed, and practically speaking trying to
provide a layer of abstraction might not of worked very well anyways.

In other words, unless there's an obvious and easy way path to convergence, I
recommend you don't spend much time/effort on trying to share code with TDX.
