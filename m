Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DC54C7B
	for <linux-coco@lists.linux.dev>; Wed, 25 Jan 2023 15:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674661557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ICOQ0lI4jayJOi1F8jmzacTe6AptwAx/4207AzFH5bw=;
	b=RhNDdKcO895Oq4aS8xdE8TNO/rPxdzGqx6Xbi9qpoLStN6bgDyOts38JoTk54X1xJfbh06
	pRSRZQWdi4o9gy/xW3rb3Wq/BSBKUV8PIJXw9dURq6uwVOr23HFfbJSy4bCH6ySCwpeZIq
	judDaSfx0+fBOgEsqesMrQ/BM0vuS80=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-426-nfM6i2mHO-KvaUUiXCDs1A-1; Wed, 25 Jan 2023 10:45:55 -0500
X-MC-Unique: nfM6i2mHO-KvaUUiXCDs1A-1
Received: by mail-wm1-f72.google.com with SMTP id k34-20020a05600c1ca200b003db30c3ed63so9239428wms.2
        for <linux-coco@lists.linux.dev>; Wed, 25 Jan 2023 07:45:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICOQ0lI4jayJOi1F8jmzacTe6AptwAx/4207AzFH5bw=;
        b=ESfSRY0ZKtvMcGVDAIxtrL2bD+0NUxZuAhgfGhE9+HQwR4kqdLWOsG8mChMjqaKUhl
         K3L9gtoUq43XwPpG3fafGcVDlXWTzBZmn0OXMePRM5Ey0OxclrkQOlwkEzjvYVr2OYX3
         owJM29sOKHDIMuu9nawZQQoqlRag/wybK1LEMxrLLZJCaBv8UZlFrzBRIVgrmKpY22xe
         f9SnXgwtjAHf2x38s3dVV/5/HnvPLIwbc1xWAIzbE09aqulVUMKVSjjIu7Aiimasj4b8
         E18nCEUHgfCYjVjKkSkzPGwwDJ9DwLuwVTjlehqxl0HI9/lyL3owwFcQ0stfEXHyTS/j
         GKGQ==
X-Gm-Message-State: AFqh2kpQcrlDzC5I2k7rg/EBcji9IQDcrRsAkUqNgDt2oOvNN/uhjqVB
	ce963LKS71gVZxL1WbODpwetHzgNDCEZXiWD3xsm7lnxgGwug/+PPFMep6vbkecyo9+T6iVfbSU
	px9zigeMSg/xYxdOzzhCAWA==
X-Received: by 2002:a05:600c:5021:b0:3d9:9755:d659 with SMTP id n33-20020a05600c502100b003d99755d659mr32291952wmr.22.1674661554323;
        Wed, 25 Jan 2023 07:45:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt4r3o4JC6sVvG5SGoomw0+ADd/Yrj1/OUW7gKaL25MnQJnEVdJ/foP+g2R3Vzo9Pg6b8EB1g==
X-Received: by 2002:a05:600c:5021:b0:3d9:9755:d659 with SMTP id n33-20020a05600c502100b003d99755d659mr32291918wmr.22.1674661554080;
        Wed, 25 Jan 2023 07:45:54 -0800 (PST)
Received: from redhat.com ([2.52.134.175])
        by smtp.gmail.com with ESMTPSA id k21-20020a05600c1c9500b003da28dfdedcsm3022846wms.5.2023.01.25.07.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 07:45:53 -0800 (PST)
Date: Wed, 25 Jan 2023 10:45:48 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
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
Message-ID: <20230125103816-mutt-send-email-mst@kernel.org>
References: <DM8PR11MB57505481B2FE79C3D56C9201E7CE9@DM8PR11MB5750.namprd11.prod.outlook.com>
 <Y9EkCvAfNXnJ+ATo@kroah.com>
 <Y9Ex3ZUIFxwOBg1n@work-vm>
 <Y9E7PNmSTP5w2zuw@kroah.com>
 <Y9FDZPV7qENtNNyk@work-vm>
 <Y9FHsvVoPbgMR2s3@kroah.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Y9FHsvVoPbgMR2s3@kroah.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 25, 2023 at 04:16:02PM +0100, Greg Kroah-Hartman wrote:
> Everyone wants a subset, different from other's subset, which means you
> need them all.  Sorry.

Well if there's a very popular system (virtual in this case) that needs
a specific config to work well, then I guess
arch/x86/configs/ccguest.config or whatever might be acceptable, no?
Lots of precedent here.

-- 
MST

