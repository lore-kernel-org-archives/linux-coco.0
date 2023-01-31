Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917F5A923
	for <linux-coco@lists.linux.dev>; Tue, 31 Jan 2023 17:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675186800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w3FPeGg7hItnWxgo62PHoYeVD78xpshA0pZcr5VAtYY=;
	b=Ah/d0sbLCj4BuFyfLsNHj3ItMfK4RKCmoAJFG4tY++fley1Hvm/29/07SM+UtU09XJy17L
	C4e3W9Y63a8Cvw9bNfOZYFOsuTCo+wf76a9cEcfvxEDS68Vte15ssLY9zg+3IRpg8uMEbB
	mQyDQPDrgkSRKgBq5Md8FZkWVKon0Z8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-616-da5vdNKaPI6irbP3DA0zOQ-1; Tue, 31 Jan 2023 12:39:57 -0500
X-MC-Unique: da5vdNKaPI6irbP3DA0zOQ-1
Received: by mail-ed1-f70.google.com with SMTP id en20-20020a056402529400b004a26ef05c34so1524320edb.16
        for <linux-coco@lists.linux.dev>; Tue, 31 Jan 2023 09:39:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3FPeGg7hItnWxgo62PHoYeVD78xpshA0pZcr5VAtYY=;
        b=dRM/7JYIm2Y+2oWSHP9nlCXUFwrUCr0MNuE7hmsZDMQzOuYAMk4kfMvN3Et7hEviNX
         s3vvo0yBy7t2mgDopR8F3b0WJspeQMsX0J+T22a7jWqVUvIq9gtEroSC6RZ7ODpCeC+w
         ogqDSkercHiGIdGWSFI1S6DDZk/f/apafZgsxx9gIP5Qru6Y90hFgCoy4FG3fxpad6m6
         2oMLWVmftQ8N3O8KOkd7Y+X7MFziEf92YMYWOfmt3HsIN/Y2rFTNJtMdLA+md8ilG4Ue
         DlHJj5A2qSqUY9vhE5UYNf+bduNpPIPlb+3u+MZHWzQY/KVop6fsVxTN2mjtzZzMG5bY
         NRqg==
X-Gm-Message-State: AO0yUKVw1R2GVaV2SZ4kMERc2CUfCJ2hAqBRaWUzP+8/PaML/y8YBDGL
	U7FUKIHuMBrZATwyPGrlg8VmUmFMgUoolTgi5UzmQlanqQ2HGnlMU9GvkYhRLULxkqeDHZ26JdZ
	sc4ZKgwTxhGDySrngYwBTLg==
X-Received: by 2002:a05:6402:35c6:b0:46f:d386:117d with SMTP id z6-20020a05640235c600b0046fd386117dmr5019299edc.33.1675186796129;
        Tue, 31 Jan 2023 09:39:56 -0800 (PST)
X-Google-Smtp-Source: AK7set9ZPgbwWWTJbgUH+vDerGoDBXBQ/8n25BR+kRZY16ejwePSwXUQ1VHiheonNGFC8dalJpBx8Q==
X-Received: by 2002:a05:6402:35c6:b0:46f:d386:117d with SMTP id z6-20020a05640235c600b0046fd386117dmr5019279edc.33.1675186795943;
        Tue, 31 Jan 2023 09:39:55 -0800 (PST)
Received: from redhat.com ([2.52.144.173])
        by smtp.gmail.com with ESMTPSA id ed10-20020a056402294a00b004a236384909sm4304467edb.10.2023.01.31.09.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 09:39:55 -0800 (PST)
Date: Tue, 31 Jan 2023 12:39:48 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christophe de Dinechin <dinechin@redhat.com>
Cc: jejb@linux.ibm.com, "Reshetova, Elena" <elena.reshetova@intel.com>,
	Leon Romanovsky <leon@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Shishkin, Alexander" <alexander.shishkin@intel.com>,
	"Shutemov, Kirill" <kirill.shutemov@intel.com>,
	"Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@intel.com>,
	"Kleen, Andi" <andi.kleen@intel.com>,
	"Hansen, Dave" <dave.hansen@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	"Wunner, Lukas" <lukas.wunner@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	"Poimboe, Josh" <jpoimboe@redhat.com>,
	"aarcange@redhat.com" <aarcange@redhat.com>,
	Cfir Cohen <cfir@google.com>, Marc Orr <marcorr@google.com>,
	"jbachmann@google.com" <jbachmann@google.com>,
	"pgonda@google.com" <pgonda@google.com>,
	"keescook@chromium.org" <keescook@chromium.org>,
	James Morris <jmorris@namei.org>,
	Michael Kelley <mikelley@microsoft.com>,
	"Lange, Jon" <jlange@microsoft.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Kernel Hardening <kernel-hardening@lists.openwall.com>
Subject: Re: Linux guest kernel threat model for Confidential Computing
Message-ID: <20230131123033-mutt-send-email-mst@kernel.org>
References: <Y9Jh2x9XJE1KEUg6@unreal>
 <DM8PR11MB5750414F6638169C7097E365E7CF9@DM8PR11MB5750.namprd11.prod.outlook.com>
 <Y9JyW5bUqV7gWmU8@unreal>
 <DM8PR11MB57507D9C941D77E148EE9E87E7CF9@DM8PR11MB5750.namprd11.prod.outlook.com>
 <702f22df28e628d41babcf670c909f1fa1bb3c0c.camel@linux.ibm.com>
 <DM8PR11MB5750F939C0B70939AD3CBC37E7D39@DM8PR11MB5750.namprd11.prod.outlook.com>
 <220b0be95a8c733f0a6eeddc08e37977ee21d518.camel@linux.ibm.com>
 <DM8PR11MB575074D3BCBD02F3DD677A57E7D09@DM8PR11MB5750.namprd11.prod.outlook.com>
 <261bc99edc43990eecb1aac4fe8005cedc495c20.camel@linux.ibm.com>
 <m2h6w6k5on.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <m2h6w6k5on.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 31, 2023 at 04:14:29PM +0100, Christophe de Dinechin wrote:
> Finally, security considerations that apply irrespective of whether the
> platform is confidential or not are also outside of the scope of this
> document. This includes topics ranging from timing attacks to social
> engineering.

Why are timing attacks by hypervisor on the guest out of scope?

> </doc>
> 
> Feel free to comment and reword at will ;-)
> 
> 
> 3/ PCI-as-a-threat: where does that come from
> 
> Isn't there a fundamental difference, from a threat model perspective,
> between a bad actor, say a rogue sysadmin dumping the guest memory (which CC
> should defeat) and compromised software feeding us bad data? I think there
> is: at leats inside the TCB, we can detect bad software using measurements,
> and prevent it from running using attestation.  In other words, we first
> check what we will run, then we run it. The security there is that we know
> what we are running. The trust we have in the software is from testing,
> reviewing or using it.
> 
> This relies on a key aspect provided by TDX and SEV, which is that the
> software being measured is largely tamper-resistant thanks to memory
> encryption. In other words, after you have measured your guest software
> stack, the host or hypervisor cannot willy-nilly change it.
> 
> So this brings me to the next question: is there any way we could offer the
> same kind of service for KVM and qemu? The measurement part seems relatively
> easy. Thetamper-resistant part, on the other hand, seems quite difficult to
> me. But maybe someone else will have a brilliant idea?
> 
> So I'm asking the question, because if you could somehow prove to the guest
> not only that it's running the right guest stack (as we can do today) but
> also a known host/KVM/hypervisor stack, we would also switch the potential
> issues with PCI, MSRs and the like from "malicious" to merely "bogus", and
> this is something which is evidently easier to deal with.

Agree absolutely that's much easier.

> I briefly discussed this with James, and he pointed out two interesting
> aspects of that question:
> 
> 1/ In the CC world, we don't really care about *virtual* PCI devices. We
>    care about either virtio devices, or physical ones being passed through
>    to the guest. Let's assume physical ones can be trusted, see above.
>    That leaves virtio devices. How much damage can a malicious virtio device
>    do to the guest kernel, and can this lead to secrets being leaked?
> 
> 2/ He was not as negative as I anticipated on the possibility of somehow
>    being able to prevent tampering of the guest. One example he mentioned is
>    a research paper [1] about running the hypervisor itself inside an
>    "outer" TCB, using VMPLs on AMD. Maybe something similar can be achieved
>    with TDX using secure enclaves or some other mechanism?

Or even just secureboot based root of trust?

-- 
MST

