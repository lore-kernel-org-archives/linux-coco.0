Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1B533F0
	for <linux-coco@lists.linux.dev>; Thu, 26 Jan 2023 16:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674750333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CyqC4HBKoEgyHHDtYb2+ga2T4D19HRBTg8u+WniVOaQ=;
	b=d35bFUcUlSUSSOz7O7/+RMF2P+0Xxk1GpzKQp4/+dybdWDGiaCL6z0dR18NVw+AKLhNK00
	XG/WhPjiP+3Se3C+ASbpTuNWpqlxSNWApnYsNaJFGTjZplPVF6/8HH0e5mcKSIWx4eALYG
	s8jJcLo6DuOHWKgXL3hbn80kBb0G1O8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-90-2H9cPzB3PZmUbalQewq9dQ-1; Thu, 26 Jan 2023 11:25:29 -0500
X-MC-Unique: 2H9cPzB3PZmUbalQewq9dQ-1
Received: by mail-wr1-f72.google.com with SMTP id l8-20020adfc788000000b002bdfe72089cso428192wrg.21
        for <linux-coco@lists.linux.dev>; Thu, 26 Jan 2023 08:25:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CyqC4HBKoEgyHHDtYb2+ga2T4D19HRBTg8u+WniVOaQ=;
        b=w3yKQVZq55Bwc4vsbgCsX3N1RYlEtNYG4saZne3FGa3bYyZ/AAz0FnY9FbQXr5+7Nv
         Q4moMm1C5gZqrItUUP31WvofUuoNoYOSXNaNTPTIuU3tWO40i/5w5lhKb2UuCpqKMVk1
         ZzaCRYTtC8fINsAFFRo5HjxDGwNyl1u5Y8RXMIVYtbluEnjJv38JrF2MP+n1xmrMfOJB
         VsaofpigMABUmyoZPlhnYj7YfD8uJbkAkSEW1uCEeXsS2Ee2L0rSgN8rJaiFNyFvAC6m
         iD/v2gWuT7Y3s7kxBhRUlDlEFwURKl/LM0VQHW3aetEmZJeVDJz5vr+mgDH1Xi7BCwed
         HOLA==
X-Gm-Message-State: AFqh2kotwZxDHvyruNJAnTvxaa0Ko5EUQVwtJP3pF0jFaTgU1hbNCnfs
	MESStKfVbNv5W/sP76qlijJoXWHxSlNj6fasxzVtB+nWc62FXhFtpmo/072skJ3dquegGnUjCsz
	Rm7uysxiVB1jMmfnVDQFR2g==
X-Received: by 2002:a05:600c:3488:b0:3cf:68f8:790b with SMTP id a8-20020a05600c348800b003cf68f8790bmr33587603wmq.11.1674750327871;
        Thu, 26 Jan 2023 08:25:27 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv5e8MKjFsCkVUne5IjgyuScDl6uyyRaHtc0mBQA3MKSQ6ykJ/gLCNS/1L73hNUG/JIUAeP8g==
X-Received: by 2002:a05:600c:3488:b0:3cf:68f8:790b with SMTP id a8-20020a05600c348800b003cf68f8790bmr33587572wmq.11.1674750327685;
        Thu, 26 Jan 2023 08:25:27 -0800 (PST)
Received: from redhat.com ([2.52.137.69])
        by smtp.gmail.com with ESMTPSA id c11-20020adfa30b000000b002bfb5ebf8cfsm1822818wrb.21.2023.01.26.08.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 08:25:26 -0800 (PST)
Date: Thu, 26 Jan 2023 11:25:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: Samuel Ortiz <sameo@rivosinc.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Reshetova, Elena" <elena.reshetova@intel.com>,
	"Shishkin, Alexander" <alexander.shishkin@intel.com>,
	"Shutemov, Kirill" <kirill.shutemov@intel.com>,
	"Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@intel.com>,
	"Kleen, Andi" <andi.kleen@intel.com>,
	"Hansen, Dave" <dave.hansen@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
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
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-pci@vger.kernel.org
Subject: Re: Linux guest kernel threat model for Confidential Computing
Message-ID: <20230126112058-mutt-send-email-mst@kernel.org>
References: <DM8PR11MB57505481B2FE79C3D56C9201E7CE9@DM8PR11MB5750.namprd11.prod.outlook.com>
 <Y9EkCvAfNXnJ+ATo@kroah.com>
 <Y9Ex3ZUIFxwOBg1n@work-vm>
 <Y9E7PNmSTP5w2zuw@kroah.com>
 <Y9FDZPV7qENtNNyk@work-vm>
 <20230125215333.GA18160@wunner.de>
 <CAGXJix9-cXNW7EwJf0PVzj_Qmt5fmQvBX1KvXfRX5NAeEpnMvw@mail.gmail.com>
 <20230126154449.GB4188@wunner.de>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230126154449.GB4188@wunner.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 26, 2023 at 04:44:49PM +0100, Lukas Wunner wrote:
> Obviously the host can DoS guest access to the device by modifying
> exchanged messages, but there are much simpler ways for it to
> do that, say, by clearing Bus Master Enable or Memory Space Enable
> bits in the Command Register.

There's a single key per guest though, isn't it? Also used
for regular memory?


-- 
MST

