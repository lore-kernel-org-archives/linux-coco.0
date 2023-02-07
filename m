Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C648BF1
	for <linux-coco@lists.linux.dev>; Tue,  7 Feb 2023 21:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675806910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ns5gbnLKn7zHOFaovfJzTuDPPi31RWqzHCdX60ieJbU=;
	b=ZSilrOmE0+nZvFp7s6UN5fVoYB7GKidDdBzPslSHDMRnLMtu6GZvvX2LmWQUTGu6Kvt3Yd
	1tjVLGf+/tuVSoNIM8rPG3GXlX+dPDF35fbRLSbMJIxuDGn+VHlbZtc9EGPuEe7uvhBQxM
	2LuFf58YDRPdVPSYi55yFG7JcJc8niI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-151-nPEHa01WNlKV_SA1-I39LA-1; Tue, 07 Feb 2023 16:55:09 -0500
X-MC-Unique: nPEHa01WNlKV_SA1-I39LA-1
Received: by mail-wm1-f70.google.com with SMTP id fl9-20020a05600c0b8900b003dfe4bae099so78162wmb.0
        for <linux-coco@lists.linux.dev>; Tue, 07 Feb 2023 13:55:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ns5gbnLKn7zHOFaovfJzTuDPPi31RWqzHCdX60ieJbU=;
        b=WKXzRXdgWus8i85HsdFlLzlKF5X/xenEtUCuep6CzRo+nySb5yCuKQLDLGjKB0BBoi
         9v0KUUCKWW/1tNfIUmw702TgHuJ8eu59AgQW9nNs4gpuihPxqb4WCbCsUaP1LEmJMqqK
         G5jgsp5OJO2jQ1RgdXJ+10jluUPquE90PfWALkyh2QYUu0npQrechAsKpkWkHD8mQkEF
         v/ToWyv0Stbl76umnx1EM8810g/UAong3SDTQiGIlMM8g7v/IvEqwAAklf+bhoTFMYuj
         DdHA0mrJNhm84ojCFfODRzFTdbZR6+Swa2zhG30tLOuldTQ/77jsnVE9YFMry/tgRsYb
         +klw==
X-Gm-Message-State: AO0yUKX1S6VJU1t26LdboS7GWmcWo7ab4Ngxq0utpgPyyun7nlFY+nRF
	XN3x6AS/VBkTjsaEj53Ka9YYfu08DKBnmnuwN7eH0Ns3IS+GoNxK24vboss7NkBzX0cBIXLPbIL
	5bm4KUO3yK6fYnfMNJbmigQ==
X-Received: by 2002:adf:e80e:0:b0:2bf:f44b:7a29 with SMTP id o14-20020adfe80e000000b002bff44b7a29mr3760643wrm.40.1675806908269;
        Tue, 07 Feb 2023 13:55:08 -0800 (PST)
X-Google-Smtp-Source: AK7set9fLl/1R5rJGBWgHb0QWMHHDY5vy4t3o0CvEvD9BeBmDvf9BeYOTUlFuO7kX7ZNygt81a0bVA==
X-Received: by 2002:adf:e80e:0:b0:2bf:f44b:7a29 with SMTP id o14-20020adfe80e000000b002bff44b7a29mr3760626wrm.40.1675806908075;
        Tue, 07 Feb 2023 13:55:08 -0800 (PST)
Received: from redhat.com ([2.52.8.17])
        by smtp.gmail.com with ESMTPSA id a18-20020a5d4572000000b002c3e7474b0fsm6558116wrc.13.2023.02.07.13.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 13:55:07 -0800 (PST)
Date: Tue, 7 Feb 2023 16:55:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Carlos Bilbao <carlos.bilbao@amd.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Message-ID: <20230207165103-mutt-send-email-mst@kernel.org>
References: <DM8PR11MB57505481B2FE79C3D56C9201E7CE9@DM8PR11MB5750.namprd11.prod.outlook.com>
 <658272b5-9547-a69f-b6c9-a7ff2dd2d468@amd.com>
 <Y+HpmIesY96cYcWQ@kroah.com>
 <20044cae-4fab-7ef6-02a0-5955a56e5767@amd.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20044cae-4fab-7ef6-02a0-5955a56e5767@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 07, 2023 at 01:53:34PM -0600, Carlos Bilbao wrote:
> Given the limitations of current approach, does anyone have any other ideas
> for filtering devices prior to their initialization?

/me mumbles ... something something ... bpf ...

-- 
MST

