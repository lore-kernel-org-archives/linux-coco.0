Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669B228E3
	for <linux-coco@lists.linux.dev>; Mon, 30 Jan 2023 15:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675091693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x2kjRBE9UKCBXQY30JsYq6YWQr5DUvJD0QimN47cIKM=;
	b=Qui2lVUIjM/e7t6NqXeFCHZGtw5SNX6/vtKS0gMtN4rkLNPTN9q+y/d24FcySfSa+zNXmc
	2SwRNmjUcADoSabMB7HwZU9O6iQ1Y1xWZdHHknAisDYmiZI7stHOiIGkIwZTylNWgpPqwF
	eSmu5Vkp756SHNdVlpYFrHFm4MP0Lvw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-625-omHOb1rBMqSxADIOBtyV3Q-1; Mon, 30 Jan 2023 10:14:51 -0500
X-MC-Unique: omHOb1rBMqSxADIOBtyV3Q-1
Received: by mail-wm1-f69.google.com with SMTP id l8-20020a05600c1d0800b003dc25f6bb5dso7740651wms.0
        for <linux-coco@lists.linux.dev>; Mon, 30 Jan 2023 07:14:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x2kjRBE9UKCBXQY30JsYq6YWQr5DUvJD0QimN47cIKM=;
        b=ueYZnztCuxORyljjSJ1Ip2wAAJUu919QPIYLP09PNpnc8zBetNBrByETxOOnrXIKD9
         i/f03IrjyZf7Erzr6oRKxavB/yXlX288mYNEPqOEKy8vR/vvZGWo9dOR7z5kSskUeL5P
         29Qn0RvYInQKjgZSoQhWkyhCAQWE9hhlfpDM7WLOpNgcurrTE1uqrNFj/BqIl3p0sObP
         R/8sjzm4+cAcYtJrEaKSD55Xt1dB0urS8P+xHN0X4q4RCjqwcT+LCQnkMRbGd8XpXnEa
         DTMFZsa++RdYRHESF52stpvg2XWHHGWZuw15/wngOxLz1NUufRzW7mJeZXiJ6vn1gIac
         PHgw==
X-Gm-Message-State: AO0yUKXXIwwYPmZVhUV1FHjD8Q1PrLxu6rtM2VMRoe6zAAx0QGSem8UZ
	+A3/nrwpN/9TN9OFYhmhq9iEdRih/EWubkzxZ/z12iLoPbgpdKwlzNaDyfOpL4OyfHL2t2PM9YM
	v7A3xnYrWs8LWKm7qUYwbvQ==
X-Received: by 2002:a05:600c:46ca:b0:3dc:5390:6499 with SMTP id q10-20020a05600c46ca00b003dc53906499mr5836140wmo.1.1675091690660;
        Mon, 30 Jan 2023 07:14:50 -0800 (PST)
X-Google-Smtp-Source: AK7set/WOOsBPhtnJOL1eweoIstR30lA3PseamBTWifpvvRSPHKnTRSjopwyGEKKuEEuhs/8HZcygA==
X-Received: by 2002:a05:600c:46ca:b0:3dc:5390:6499 with SMTP id q10-20020a05600c46ca00b003dc53906499mr5836101wmo.1.1675091690402;
        Mon, 30 Jan 2023 07:14:50 -0800 (PST)
Received: from redhat.com ([2.52.144.173])
        by smtp.gmail.com with ESMTPSA id n10-20020a05600c180a00b003daf672a616sm12758048wmp.22.2023.01.30.07.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 07:14:49 -0800 (PST)
Date: Mon, 30 Jan 2023 10:14:43 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Christophe de Dinechin <dinechin@redhat.com>,
	"Reshetova, Elena" <elena.reshetova@intel.com>,
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
Message-ID: <20230130101426-mutt-send-email-mst@kernel.org>
References: <DM8PR11MB57505481B2FE79C3D56C9201E7CE9@DM8PR11MB5750.namprd11.prod.outlook.com>
 <m2pmaw5jv4.fsf@redhat.com>
 <20230130120052.7wfb5i2vql5ibkso@box.shutemov.name>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230130120052.7wfb5i2vql5ibkso@box.shutemov.name>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 30, 2023 at 03:00:52PM +0300, Kirill A. Shutemov wrote:
> On Mon, Jan 30, 2023 at 12:36:34PM +0100, Christophe de Dinechin wrote:
> > Is there for example anything that precludes TDX or SEV from executing
> > code in the bounce buffers?
> 
> In TDX, attempt to fetch instructions from shared memory (i.e. bounce
> buffer) will cause #GP, only data fetch is allowed. Page table also cannot
> be placed there and will cause the same #GP.

Same with SEV IIRC.

-- 
MST

