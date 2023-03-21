Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07553D2ED
	for <linux-coco@lists.linux.dev>; Tue, 21 Mar 2023 16:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679417786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9OqcAcS7FNBCqJpb8LojZmWJLhRai7O1ouWODgUg8X0=;
	b=JEg1OBuH4dG3TBksk429UdK/uW4Gje196Awb6Xo7jF1tJkXpebyxsOxhqoNODXymgkrS1N
	3cMsp/CQ2eD/24bp/iHPb0jzy21supkUCsjiFKzG/QaU17EffjWrTBqadjb2Nn502O1iOu
	ISZMEnSac1QGzTBhIrGLuq13NlkA3x0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-Oo5bR9MaNP6_uVplzv1AwQ-1; Tue, 21 Mar 2023 12:56:24 -0400
X-MC-Unique: Oo5bR9MaNP6_uVplzv1AwQ-1
Received: by mail-wr1-f72.google.com with SMTP id r24-20020adfa158000000b002d87f33e2b9so464786wrr.10
        for <linux-coco@lists.linux.dev>; Tue, 21 Mar 2023 09:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679417783;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9OqcAcS7FNBCqJpb8LojZmWJLhRai7O1ouWODgUg8X0=;
        b=rGkCetP6VjfkIzEQiCexZOfJ6zY/wtKfF/vx8oN5ikhMXCd6eC4yr0hcyRxW06PX2V
         ReJHvcgn3DTkx7CfwhhvjZvlJSNV/XMJcD3IfepbFlPmk15MgPhNthU67ykaEuuK3H1r
         L8cVEAqHo2teCkRuCMJ7vDICP4jc8EN6b8d2Y5GlHFuro4lLO5Y39r9Wlc3At0Ec3pc+
         ro5gFsGDojy4N/3g7Xi8BkpnpNbNo4mBbfRyZbf6uRyCUKQ+X+YPNMphRjdzOs+ZjNxq
         tNMOM+qGBsS9osiab7mgoUhgkfAy6xbX2shthW8f5t6eq8cFRVoWvozwFSlr3PnoJJ4l
         85ug==
X-Gm-Message-State: AO0yUKVsA1BxeWrgnaRImPNdTjYiwLS+xe1UEMmc9lqmNW3Gf7K32Gzn
	Zmoo/kRzD7wAqBUjis6VKY8tpi6U0KveFkHG+nV5+uF+iYQq4g2/cpG8gDcWLu5oWANIUmG/lFy
	WcJB6oVP61U0S431Rz83ESw==
X-Received: by 2002:a5d:54c1:0:b0:2ce:9da7:6d42 with SMTP id x1-20020a5d54c1000000b002ce9da76d42mr3148430wrv.38.1679417783651;
        Tue, 21 Mar 2023 09:56:23 -0700 (PDT)
X-Google-Smtp-Source: AK7set9VlqhK62PIZ1ifVe9xiKQRc0PeyNde10rompP/NnikUzFrHTHj5ki6GBJAVhBpZihOwxnJAw==
X-Received: by 2002:a5d:54c1:0:b0:2ce:9da7:6d42 with SMTP id x1-20020a5d54c1000000b002ce9da76d42mr3148413wrv.38.1679417783301;
        Tue, 21 Mar 2023 09:56:23 -0700 (PDT)
Received: from work-vm (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
        by smtp.gmail.com with ESMTPSA id x12-20020a5d650c000000b002c5544b3a69sm11738114wru.89.2023.03.21.09.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 09:56:22 -0700 (PDT)
Date: Tue, 21 Mar 2023 16:56:20 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: =?iso-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>
Cc: amd-sev-snp@lists.suse.com, linux-coco@lists.linux.dev,
	kvm@vger.kernel.org
Subject: Re: [ANNOUNCEMENT] COCONUT Secure VM Service Module for SEV-SNP
Message-ID: <ZBnhtEsMhuvwfY75@work-vm>
References: <ZBl4592947wC7WKI@suse.de>
 <ZBnH600JIw1saZZ7@work-vm>
 <ZBnMZsWMJMkxOelX@suse.de>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZBnMZsWMJMkxOelX@suse.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

* Jörg Rödel (jroedel@suse.de) wrote:
> Hi Dave,
> 
> On Tue, Mar 21, 2023 at 03:06:19PM +0000, Dr. David Alan Gilbert wrote:
> > Interesting; it would have been nice to have known about this a little
> > earlier, some people have been working on stuff built on top of the AMD
> > one for a while.
> 
> Sorry for that, we wanted to have it in a state where it could at least
> boot an SMP Linux guest. It took us some more time to get the
> foundations right and get to that point.
> 
> > You mention two things that I wonder how they interact:
> > 
> >   a) TPMs in the future at a higher ring
> >   b) Making (almost) unmodified guests
> > 
> > What interface do you expect the guest to see from the TPM - would it
> > look like an existing TPM hardware interface or would you need some
> > changes?
> 
> For a) without b) the guest interface will be the SVSM TPM protocol. The
> ring-0 code will forward any request to the TPM process and return to
> the guest when it is done.
> 
> For b), or the paravisor mode, this is the vision, which is probably
> more than a year out. The idea behind that is to be able to emulate what
> Hyper-V is doing to boot Windows guests under SEV-SNP on an open source
> SW stack.
> 
> How the TPM interface will look like for that paravisor mode is not
> clear yet. In theory we can emulate a real TPM interface to make this
> work, but that is not sure yet.

OK, I'm just trying to avoid having guests that have a zillion different
TPM setups for different SVSM and clouds.

Timing is a little tricky here; in many ways the thing that sounds
nicest to me about Coconut is the mostly-unmodified guest (b) - but if
that's a while out then hmm.

Dave

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

