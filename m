Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDA42560
	for <linux-coco@lists.linux.dev>; Wed,  8 Feb 2023 13:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675861216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GZD4eF51TgC9oueoQn3RvNXVi7q+IJ98lRzwYnyNJW8=;
	b=YAW6sDfscXM8PznbN0eDrE+U0rSgnIGRveOEgPv6qPPYlP0xo5GpssPhU/83zrlORCDI1X
	lf+mgi+YRvq4lVLd9wNgwkZYneL8NuMdEH/mR+Y+eJqYn0sl2fAR1z8NT9cTDHe50hyy4f
	3Xp9hAZ3UedRL5eRvTuEh11ButMdA4E=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-599-kh1_htmHNI65mJegdh3_Hw-1; Wed, 08 Feb 2023 08:00:15 -0500
X-MC-Unique: kh1_htmHNI65mJegdh3_Hw-1
Received: by mail-ej1-f70.google.com with SMTP id qa17-20020a170907869100b0088ea39742c8so13235396ejc.13
        for <linux-coco@lists.linux.dev>; Wed, 08 Feb 2023 05:00:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZD4eF51TgC9oueoQn3RvNXVi7q+IJ98lRzwYnyNJW8=;
        b=zygjqPYR0t7b69ksMa7U/ZT/73/1iR8KpgOaJb6t3NbLIwDk5+XxhHIc1zKl9GmSD9
         55lLrsf8FWCMOGIr7k9l2E1Fb2LzcKfoFu1yWwoq4+HTDiDJDwM4+KRPrASR+eaKkJQy
         oKRh7OSayLiXQZBKZPhSy2ThzxKYTJeuNhMmJCYG5aWT2BnpBUuiWwFxICLoXaEFNoGG
         lKrvLT2Gz6Gzb5oGe7U2dUaEF4WPLbqCKyA6HftLxpB/t2R0/0PHX9zPJtaZUAZcFkgS
         Z6I4SImGvTh0o+amXgfbbXrqIrPvIq2PwFteHDD7Oz4uHcu86kBi5gpD6KTbUBvJqnnj
         3Ydg==
X-Gm-Message-State: AO0yUKXaUjJ+8rmb6YFUWJdtEe7vRguR52sjEkK257t5tvPEKdoev1A3
	XP4ki7kfccueaf0nuRG/YUu42e1QdlXmjF2omHf5X5SkLd3pfal36b9FgDC/Fk1RfWd7EuSTfon
	gQw3/ihtXztCGucG+xx3oFA==
X-Received: by 2002:a17:907:160e:b0:8aa:c035:a651 with SMTP id hb14-20020a170907160e00b008aac035a651mr4776188ejc.37.1675861212224;
        Wed, 08 Feb 2023 05:00:12 -0800 (PST)
X-Google-Smtp-Source: AK7set+Y3v6ZDYs6fJVD6bZp4jFnLUDSB+F47FHl799qXTEy7dorD0nLqLTYAKPJs+2DVrLfitMtjQ==
X-Received: by 2002:a17:907:160e:b0:8aa:c035:a651 with SMTP id hb14-20020a170907160e00b008aac035a651mr4776167ejc.37.1675861212053;
        Wed, 08 Feb 2023 05:00:12 -0800 (PST)
Received: from redhat.com ([2.52.132.212])
        by smtp.gmail.com with ESMTPSA id de48-20020a1709069bf000b0088cf92eb0e1sm8267710ejc.150.2023.02.08.05.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 05:00:11 -0800 (PST)
Date: Wed, 8 Feb 2023 08:00:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Reshetova, Elena" <elena.reshetova@intel.com>
Cc: Theodore Ts'o <tytso@mit.edu>, Carlos Bilbao <carlos.bilbao@amd.com>,
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
Message-ID: <20230208075747-mutt-send-email-mst@kernel.org>
References: <DM8PR11MB57505481B2FE79C3D56C9201E7CE9@DM8PR11MB5750.namprd11.prod.outlook.com>
 <658272b5-9547-a69f-b6c9-a7ff2dd2d468@amd.com>
 <Y+HpmIesY96cYcWQ@kroah.com>
 <20044cae-4fab-7ef6-02a0-5955a56e5767@amd.com>
 <Y+MAPHZNLeBY13Pj@mit.edu>
 <20230208041913-mutt-send-email-mst@kernel.org>
 <DM8PR11MB5750D93CD9481F6AB78F1FB4E7D89@DM8PR11MB5750.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <DM8PR11MB5750D93CD9481F6AB78F1FB4E7D89@DM8PR11MB5750.namprd11.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 08, 2023 at 10:44:25AM +0000, Reshetova, Elena wrote:
> Because for the
> drivers that CoCo guest happens to need, there is no way to fix this problem by 
> either of these mechanisms (we cannot disable the code that we need), unless somebody
> writes a totally new set of coco specific drivers (who needs another set of 
> CoCo specific virtio drivers in the kernel?). 

I think it's more about pci and all that jazz, no?
As a virtio maintainer I applied patches adding validation and intend to
do so in the future simply because for virtio specifically people
build all kind of weird setups out of software and so validating
everything is a good idea.

-- 
MST

