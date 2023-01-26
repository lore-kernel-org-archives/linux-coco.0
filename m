Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7ED2291A
	for <linux-coco@lists.linux.dev>; Thu, 26 Jan 2023 15:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674746534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YiWnUSu55NG/fxtmWuYsdLF85NahVTAKDGkr6o00Vrw=;
	b=GAPS0MxACAzt40+AR+5rW8E5giq3TTwaA2Jj0Ud+DDFoPc3IrN/kQRggDwQ7kqAp+R0Q4a
	s9AN3QqJRnJqTfU85ZTtttPQCMtFUgxESRLknVnEuZJj+xSCEi+vP9yzBp9f+9l8NO2vsd
	mecEpg//R9ZLtLYsHWpDeEaml/OeM4w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-187--P3Po8v4Nga-Cl2lNoDOgg-1; Thu, 26 Jan 2023 10:22:13 -0500
X-MC-Unique: -P3Po8v4Nga-Cl2lNoDOgg-1
Received: by mail-wr1-f69.google.com with SMTP id v5-20020adf8b45000000b002bde0366b11so391325wra.7
        for <linux-coco@lists.linux.dev>; Thu, 26 Jan 2023 07:22:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YiWnUSu55NG/fxtmWuYsdLF85NahVTAKDGkr6o00Vrw=;
        b=DsKRHhB3yX/0LsEh2NT2QuUfx+N22gX5rATmTbiMOVZx57h6mpTd1UIpOc4BKSWAg8
         /bu4nJusfKrK4N4xPX9szVOR4TPUKCxEJ1YHmYJjhsH+W9hpxHfTRVR9kzynzMBkqXKO
         GLd9nZh7FCgwlXMUKFBi5ufdeJBPSIHKYmH35Kmkw8E08v8ILMdn4yocsGKd/zu8afwJ
         kcfe2YsCN9GK8LojGNJ7dLZku/7XyV6b8+72ftPWUcWS+XzTEA23poE5CcI1h+FrM/+g
         lMS06c4z12bVmTK8WP3FBO/sG0yRJB9fDMm5Wf2CDcJRngxpqTPiEoFKlO7Z+V8jyI7i
         jE3g==
X-Gm-Message-State: AFqh2kozjoD00Pnt9BFuyF8WFglduZIh1HuL2ewvsR3udwIqPyccYWYn
	12g35Qt4tNvQjVmBD2D6IXbFdh+uRQmE7GqHIhGxQ0+SOFwKXweepVpKFjPM8yCRYPV/h0Fw7mK
	Hs2xzjzSLqUB1jYQO4PcpbQ==
X-Received: by 2002:adf:f0c1:0:b0:2bc:67d:c018 with SMTP id x1-20020adff0c1000000b002bc067dc018mr32580418wro.48.1674746532275;
        Thu, 26 Jan 2023 07:22:12 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvUoxvlfIjwabTI32l3InDigTpv5ZMbqGg+D9q3vmaeIBrib7FBQMUubpGP2ULG/rDQpSaxDw==
X-Received: by 2002:adf:f0c1:0:b0:2bc:67d:c018 with SMTP id x1-20020adff0c1000000b002bc067dc018mr32580394wro.48.1674746532076;
        Thu, 26 Jan 2023 07:22:12 -0800 (PST)
Received: from work-vm (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
        by smtp.gmail.com with ESMTPSA id c7-20020adfe707000000b002bfb0c5527esm1555390wrm.109.2023.01.26.07.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 07:22:11 -0800 (PST)
Date: Thu, 26 Jan 2023 15:22:09 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Reshetova, Elena" <elena.reshetova@intel.com>,
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
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Linux guest kernel threat model for Confidential Computing
Message-ID: <Y9KaoZKjyKD8aokf@work-vm>
References: <DM8PR11MB57505481B2FE79C3D56C9201E7CE9@DM8PR11MB5750.namprd11.prod.outlook.com>
 <Y9EkCvAfNXnJ+ATo@kroah.com>
 <Y9Ex3ZUIFxwOBg1n@work-vm>
 <Y9E5Cg7mreDx737N@redhat.com>
 <CAFLxGvwHRK3vyXiCv5ELvrDSEkcDgV5c6pNnWgWhcATfp1dedA@mail.gmail.com>
 <Y9KVHnHnig4jwNPx@work-vm>
 <CAFLxGvyMncqjkEXiOqenQu+rZW46RP7UorXs36+awmgnBxTGhA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAFLxGvyMncqjkEXiOqenQu+rZW46RP7UorXs36+awmgnBxTGhA@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

* Richard Weinberger (richard.weinberger@gmail.com) wrote:
> On Thu, Jan 26, 2023 at 3:58 PM Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > * Richard Weinberger (richard.weinberger@gmail.com) wrote:
> > > On Wed, Jan 25, 2023 at 3:22 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > > Any virtual device exposed to the guest that can transfer potentially
> > > > sensitive data needs to have some form of guest controlled encryption
> > > > applied. For disks this is easy with FDE like LUKS, for NICs this is
> > > > already best practice for services by using TLS. Other devices may not
> > > > have good existing options for applying encryption.
> > >
> > > I disagree wrt. LUKS. The cryptography behind LUKS protects persistent data
> > > but not transport. If an attacker can observe all IO you better
> > > consult a cryptographer.
> > > LUKS has no concept of session keys or such, so the same disk sector will
> > > always get encrypted with the very same key/iv.
> >
> > Are you aware of anything that you'd use instead?
> 
> Well, I'd think towards iSCSI over TLS to protect the IO transport.

Yeh, that's not entirely crazy for VMs which tend to come off some
remote storage system.

> > Are you happy with dm-verity for protection against modification?
> 
> Like LUKS (actually dm-crypt) the crypto behind is designed to protect
> persistent data not transport.
> My fear is that an attacker who is able to observe IOs can do bad things.

Hmm, OK,  I'd assumed dm-crypt was OK since it's more hashlike and
unchanging.

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

