Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B43CD530
	for <linux-coco@lists.linux.dev>; Tue, 21 Mar 2023 19:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679428455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xi2PAhl1/X1sZtFKV7ziXgFguzLsRLnrCRviZPPBROs=;
	b=BxAdZBFs6/DUu5qoIbXzRaQMYG9o43MRAJcZOug5JUmkV2ztVStYmcylzDP6fUeeFIA5ff
	nph6IO0TTszbOy7B0fvN3ppQC0U9DOj5s9T1ECLflgDuQoMSGrQj6vPmSNGam7IUSw9TTN
	945mhOC1v5iG3m+k40L+4RAa023Z2K4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-mmCJtQrfOLyQB3KXkCiWpQ-1; Tue, 21 Mar 2023 15:54:06 -0400
X-MC-Unique: mmCJtQrfOLyQB3KXkCiWpQ-1
Received: by mail-wm1-f70.google.com with SMTP id i3-20020a05600c354300b003edfa408811so3349010wmq.1
        for <linux-coco@lists.linux.dev>; Tue, 21 Mar 2023 12:54:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679428441;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xi2PAhl1/X1sZtFKV7ziXgFguzLsRLnrCRviZPPBROs=;
        b=kDOmUivgoEYzQ1BlgjFDlvWRPLANysgV4YlmehwNe3LbCTAUwGAuWW86jrLj99nxrW
         teVjZaxWkouPgmV0+8EibgduGzu4kHZR0onOzgz0bCHkFM00Bro3QYOTKYbxBJGeOFWg
         hW5JGJOWwGgDxej648mvbGvsAbW3TBALA9QT1ghO758yEZViz9ooymP8nTKqEh3rCw0H
         atVtbOQUP5hV+XNXTUstc5/WyemPbP2pdxGXQ3hNpr8vf2wiyiEKIX7QBpGppjbimjn/
         F7KHI/YEIaUwUXPHh9FQ67W8mrH11Kt/89XnecnuPu4Ddw/GQEHi4qqt/4Pp2PCtRz+O
         RfqA==
X-Gm-Message-State: AO0yUKU9LobqYV6NDaQ230eZZUexBhfGAiOFaqAPhDHUDuBXxMV/FEA2
	U9/Y46jJ0t6uSqCiH/SdbKXsere/OHTxumn+m2uLHiwwSPGMlIFewoLR8vYUJbpZj3NNo7OCKpn
	IPUZveKPJBipMoEJpFACtQQ==
X-Received: by 2002:a1c:7908:0:b0:3eb:3843:9f31 with SMTP id l8-20020a1c7908000000b003eb38439f31mr3069458wme.10.1679428440894;
        Tue, 21 Mar 2023 12:54:00 -0700 (PDT)
X-Google-Smtp-Source: AK7set8sCJ8Eh0Wi5Q2DOOU6n0YeMzIEMOKWHvrAmPdR4eo5tqhawitqom+z4+xdNSSojdgIRLY/Eg==
X-Received: by 2002:a1c:7908:0:b0:3eb:3843:9f31 with SMTP id l8-20020a1c7908000000b003eb38439f31mr3069446wme.10.1679428440642;
        Tue, 21 Mar 2023 12:54:00 -0700 (PDT)
Received: from work-vm (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
        by smtp.gmail.com with ESMTPSA id y6-20020a05600c364600b003ed2c0a0f37sm14456234wmq.35.2023.03.21.12.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 12:54:00 -0700 (PDT)
Date: Tue, 21 Mar 2023 19:53:58 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
Cc: amd-sev-snp@lists.suse.com, linux-coco@lists.linux.dev,
	kvm@vger.kernel.org
Subject: Re: [ANNOUNCEMENT] COCONUT Secure VM Service Module for SEV-SNP
Message-ID: <ZBoLVktt77F9paNV@work-vm>
References: <ZBl4592947wC7WKI@suse.de>
 <ZBnH600JIw1saZZ7@work-vm>
 <ZBnMZsWMJMkxOelX@suse.de>
 <ZBnhtEsMhuvwfY75@work-vm>
 <ZBn/ZbFwT9emf5zw@suse.de>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZBn/ZbFwT9emf5zw@suse.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

* Jörg Rödel (jroedel@suse.de) wrote:
> On Tue, Mar 21, 2023 at 04:56:20PM +0000, Dr. David Alan Gilbert wrote:
> > OK, I'm just trying to avoid having guests that have a zillion different
> > TPM setups for different SVSM and clouds.
> 
> My guess it that it will either be the SVSM TPM protocol or an emulation
> of an existing TPM interface.

OK; the other thing that needs to get nailed down for the vTPM's is the
relationship between the vTPM attestation and the SEV attestation.
i.e. how to prove that the vTPM you're dealing with is from an SNP host.
(Azure have a hack of putting an SNP attestation report into the vTPM
NVRAM; see
https://github.com/Azure/confidential-computing-cvm-guest-attestation/blob/main/cvm-guest-attestation.md
)

> > Timing is a little tricky here; in many ways the thing that sounds
> > nicest to me about Coconut is the mostly-unmodified guest (b) - but if
> > that's a while out then hmm.
> 
> Yeah, would be nice. But we are still in the early stages of SVSM
> development, so the priority now is to get services up and running.
> 
> But the project is open source and anyone can start looking into the
> unmodified guest handling and send PRs. Making this happen is certainly
> a multi-step process, as it requires several things to be implemented.
> Just out of my head an incomplete list what is required:
> 
> 	1) ReflectVC handling with instruction decoder and guest TLB
> 	   flush awareness
> 	2) vTOM handling
> 	3) Interrupt proxying using alternate injection (that can make
> 	   sense even earlier and without the other features imho)

So all the easy stuff then :-)

> So its quite some work, but if someone wants to look into that now I am
> all for it.

Dave
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

