Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1A0D306
	for <linux-coco@lists.linux.dev>; Tue, 21 Mar 2023 17:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679420924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=el/8FR11MSLB/EaEV+UrmVaTtTZHDQdY7hcD+HbWEAc=;
	b=bKpWfug58qTj0cd0GY0cEy/AFugzVk1/Emh9yIwH6ZJ7gn1gZrWozdHt627BxpwHAG/7DY
	yXP5RSppbjEadeFPnzu6+hbl2RdG2/e6ATCwkVSFOsBeqcGu1pPUkhiYjhtjimt453t7S+
	4+KABZ7+03faYFm3qYkfGbcV+LmJaIo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-BSFlRlWoNWyJjnlL-i4aPg-1; Tue, 21 Mar 2023 13:48:42 -0400
X-MC-Unique: BSFlRlWoNWyJjnlL-i4aPg-1
Received: by mail-wm1-f72.google.com with SMTP id k29-20020a05600c1c9d00b003ee3a8d547eso1126779wms.2
        for <linux-coco@lists.linux.dev>; Tue, 21 Mar 2023 10:48:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679420921;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=el/8FR11MSLB/EaEV+UrmVaTtTZHDQdY7hcD+HbWEAc=;
        b=vnYV+Ik2mlBjJ7hPNXzr+BwkWymC2Gt9HMIqmyk8am53ug2GInFGJYOe2oAmYzh3Lt
         tpwKHuW5ClYtk6+4RXRV1OvzRJ6IIdXvsapaRyJTMlv/XfKTCmWHwfALbQcSMsGtFGc3
         G/pWb4bQlNPYbL6KIi1aqkQgKhjPsbMlh/DBI8ZdUek50teRRa9OO2UdEfJPrrCcydeX
         w1eImi1g5WaTx8U2QDMWi9A5bZUDDnFx33e9umGs8TfmDSvrx5E8DHJk/pCwIFh91qhq
         c6iYTBpGU2D+IrUCePBvkRG3uI6ljYksigjyt9UrG42BeLroIzqzH++BgvzMkPbUR08p
         Y8bQ==
X-Gm-Message-State: AO0yUKUZtnTf1oEgzPlwG2NT4whkk8ZFCG4lWtCwVR12Qy2U3guoX+r/
	dpKUj8XCqIHeTXL09LSCQLjgL70XEZMx9sU16mhxeGmGs1Swvzf15iWx1z3C538X13jMDbsTX6f
	5fPnPTByEkhmcge1d4iqdDA==
X-Received: by 2002:adf:e4c1:0:b0:2cf:4583:6335 with SMTP id v1-20020adfe4c1000000b002cf45836335mr2840888wrm.29.1679420921638;
        Tue, 21 Mar 2023 10:48:41 -0700 (PDT)
X-Google-Smtp-Source: AK7set9OOda5pv5UQz1phm2CNDWtqB9rsjhLqdMKwfCXvzHQEsETLuh6DP0BbmPolCqKTlKIo3zV0w==
X-Received: by 2002:adf:e4c1:0:b0:2cf:4583:6335 with SMTP id v1-20020adfe4c1000000b002cf45836335mr2840872wrm.29.1679420921327;
        Tue, 21 Mar 2023 10:48:41 -0700 (PDT)
Received: from work-vm (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600000ce00b002be505ab59asm11799083wrx.97.2023.03.21.10.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 10:48:40 -0700 (PDT)
Date: Tue, 21 Mar 2023 17:48:38 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
Cc: James Bottomley <jejb@linux.ibm.com>, amd-sev-snp@lists.suse.com,
	linux-coco@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [ANNOUNCEMENT] COCONUT Secure VM Service Module for SEV-SNP
Message-ID: <ZBnt9pbSfp/v1bWO@work-vm>
References: <ZBl4592947wC7WKI@suse.de>
 <66eee693371c11bbd2173ad5d91afc740aa17b46.camel@linux.ibm.com>
 <ZBmmjlNdBwVju6ib@suse.de>
 <c2e8af835723c453adaba4b66db533a158076bbf.camel@linux.ibm.com>
 <ZBnJ6ZCuQJTVMM8h@suse.de>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZBnJ6ZCuQJTVMM8h@suse.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

* Jörg Rödel (jroedel@suse.de) wrote:
> On Tue, Mar 21, 2023 at 09:43:48AM -0400, James Bottomley wrote:
> > Could you describe these incompatible goals and explain why you think
> > they are incompatible (as in why you and AMD don't think you can agree
> > on it)?  That would help the rest of us understand where the two SVSM
> > implementations fit in our ongoing plans.
> 
> The goal of COCONUT is to have an SVSM which has isolation capabilities
> within itself. It already has percpu page-tables and in the end it will
> be able to run services (like the TPM) as separate processes in ring 3
> using cooperative multitasking.
> 
> With the current linux-svsm code-base this is difficult to achieve due
> to its reliance on the x86-64 crate. For supporting a user-space like
> execution mode the crate has too many limitations, mainly in its
> page-table and IDT implementations.
> 
> The IDT code from that crate, which is also used in linux-svsm, relies
> on compiler-generated entry-code. This is not enough to support a
> ring-3 execution mode with syscalls and several (possibly nested) IST
> vectors. The next problem with the IDT code is that it doesn't allow
> modification of return register state.  This makes it impossible to
> implement exception fixups to guard RMPADJUST instructions and VMPL1
> memory accesses in general.

I'm curious why you're doing isolation using ring-3 stuff rather than
another VMPL level?

Dave

> When we looked at the crate, the page-table implementation supported
> basically a direct and an offset mapping, which will get us into
> problems when support for non-contiguous mappings or sharing parts of a
> page-table with another page-table is needed. So in the very beginning
> of the project I decided to go with my own page-table implementation.
> 
> Of course we could start changing linux-svsm to support the same goals,
> but I think the end result will not be very different from what COCONUT
> looks now.
> 
> Regards,
> 
> -- 
> Jörg Rödel
> jroedel@suse.de
> 
> SUSE Software Solutions Germany GmbH
> Frankenstraße 146
> 90461 Nürnberg
> Germany
> 
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

