Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794244359;
	b=jh94KVnim3a22cYmLlzN2pyPHKvhj7ea7MxMoCCwkMVaDG7w7DUWH+/T6eSwovjTGK5j
	 dr+HyuuOgjAt1DzvihuK8MKIjVcPUnizm5qDChZBx2BCynxorUddFEVh033N+hrrqX/K3
	 2YqHH+EmAqzmx5roSTdtj6iypWEtnLBt/nMvmqiluuN8iaoKMJySGUa2PXYBhZskkByhA
	 cDakautHGJoHHwiij/YL2bOliR1gzi01kXurS67w0HGYVif5rusHp3gYQDgGhSVzdU+FK
	 NlMdgqVZqOYJr2I8Anehug12KbaCoB/eFmK/UYNxWlLQ/W8bAgOp7XsSrOeUZ+fmPlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794244359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=mldVdWBWz+slWUX+6pvLrLM/2pda4Td9vv1hcuYueHI=;
	b=SIv5OXa5QaAHWLqCHH9LXUFIfq8T4SDGT6+FtafZS1oaP1lYe1p+RDpg8/ItQ5AYn8sw
	 PD7xucMbEe48EtAPKzcFs9AFfJJKGnckeHUGiIbXWU4BgJXNW4pRlz64iMNaqu2IEzYm5
	 DxauSwAwXhrojg6ojxx4enNem4GjzWiO4RKlOzfgKG4UQt+mgmSUARa97B2uSC5amJ6LD
	 ely2AGZMXk8ElEsmYzOB4XIhalpxCEa8JgsKUEpAZ28/siSBu64wlE+DkfeZzAN8L25rA
	 o7od1S5PSXQSIxNrBJdP5oYaM9r0GIa+JXgOKAvgkLA7AbriX+A/D/w9pzmm3+yTlUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=X8rnpGdN;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B166606A31C
	for <linux-coco@lists.linux.dev>; Mon,  9 Nov 2026 17:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B166606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=X8rnpGdN
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93ece7a73b9so120258185a.3
        for <linux-coco@lists.linux.dev>; Mon, 09 Nov 2026 09:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794244358; x=1794849158; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mldVdWBWz+slWUX+6pvLrLM/2pda4Td9vv1hcuYueHI=;
        b=X8rnpGdNX6zKDfHbt/akXhdcnin7zHtAT5qVp47YdNOHjctTOnJ/BfN6lyjg2tNgR5
         ssuH9qus9IXMyB1dnaqOV53KTZm2Nm/mTQBHSn6wr/r3N13OVxqsRZ4vEJ9YRJg9xryf
         YVh3jiBDcng1Begq2Ctzaj69kK/nEwTX7/7cXSNjHrTUYOh3w9lWqD8u+r2vKHkM+Q7S
         XDFd+6yLpjpT6krztu4HDrYqBKY22QP6XxGio/OvONCLfqt18yHJoe3wEfzxU3ettukH
         mSrFJ6NuPHNr8JV8du6+TWavMqJkSX0aQWXhFyJg5i/DdZgyrX7GZleYY0E8pzqWJFNz
         BJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794244358; x=1794849158;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mldVdWBWz+slWUX+6pvLrLM/2pda4Td9vv1hcuYueHI=;
        b=jQsB8HoyY1N2dn7euzmtXK7y3fVSyupT6+M1wjwiNWOji2At9JVyIB5ZLZ9AlgribF
         lvOGFkD2T+tASv5hbGl5jSw87OYzBt52cTEAMXlYKYEmA1MqhW5/nGZHCuCzaI5Mgub6
         Lr/JCWubQAI1jVUuJlDzVp9Nbs4e2Ed8JVcGjKoxw7a/9mLcUdYsyMu7gTDoNz4ZRfXw
         VDccLkoOD7QxFu3pVK0KYkD0QDqhUdzP6QumqnrhG4YO0Q6q0xkUDhKgU2LbEtMZUxBH
         x5Yn7donHMe/N1CAye6wwk+tFrjx4O/eUHqo1IwHdsxSqWxPLYHdIyUDKOY8JpVHzEqn
         OSxA==
X-Forwarded-Encrypted: i=1; AL+hErF7BOlvxPql8PyHn8ZpKF5nnKuO/FOUPNAnVMHiOClbfO+l+qFAQoQhEkekROYsZZp7F6W0CiU1woh8@lists.linux.dev
X-Gm-Message-State: APuU4Z/TXA3xK0WAOFK9YfEuFZi9NF7ZQdNoFu2JpIgFM405lYfe+vxr
	JYpje8Z4LUFczdbvyOTCaaXEPSrfYmLntPw8xEBlrbChqUtpp8PpRjwlTw9KDnW9pJ4=
X-Gm-Gg: AYBFou3LekN17d4fcfUjAq6IvTMBZOJNHoKtZYkHd4PI1bIhrUqpSfb4VoxSGHT/X5P
	+EFcYAyElWhuK8AZp20OqMUHEq9zjorlPct7hkY0QGugVUDxUo60hI3t2ehROcB916hNAMAoK58
	D402JevicIgNxzIEg0DYw8j48gDAMSRutqAecQYlB4c00T/AIFj8whsTXuygIv2g2m5lv7uPDOw
	JVhb616YXHm5aMGFhjVI/YPimRdPOjNbyk/WGR+RcRX/Apmuu2n2YZbMFGsQVq3EKixTm5qC/gm
	0L6PYhm7Er7a6xJM0VOK7pzFfRvhAru85kXTkNp/MhMo5Ohz84W7VCRZ7Q0XYROtSDmxz5Fi8mK
	AfOJs5C8LKziM1Y/hWtSeRUVW7qRGT+UlVtGhgkglcnA2bHn4UhLYRoy755SsKsZmpqSnYt279F
	m9pAPNQygKwY7wZ8LfKQa+Knu2/yeUYFzafNuLVd9EcPIR/H+DwceZ/vxNIKxMU6ssEbwM2pp4H
	HnAltaQ9d1gyJkP8cxsT+iO8048gYP75mQrH32Js9fXoWPMKpCIMbBWYyO1EpG5Ik/gJfsJ5iD2
	Ft9ss+mcgQYAxU3+8KUSovVTWhz8hwFbAyRgS9JRckR1Qj5RXINqF+NmlHrAS58z/On/z04O2Kq
	TyAhmxMUsSA==
X-Received: by 2002:a05:620a:4625:b0:946:26a:22c4 with SMTP id af79cd13be357-9479f415545mr8700585a.73.1794244358097;
        Mon, 09 Nov 2026 09:12:38 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef0540a8dsm277806d6.41.2026.11.09.09.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:12:37 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xQSv6-00000001ryf-1fz6;
	Mon, 09 Nov 2026 13:12:36 -0400
Date: Mon, 9 Nov 2026 13:12:36 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peter Fang <peter.fang@intel.com>
Cc: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"drdeeglaze@gmail.com" <drdeeglaze@gmail.com>,
	"James.Bottomley@hansenpartnership.com" <James.Bottomley@hansenpartnership.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"Xing, Cedric" <cedric.xing@intel.com>,
	"alistair.francis@wdc.com" <alistair.francis@wdc.com>,
	"linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
	"Reshetova, Elena" <elena.reshetova@intel.com>,
	"kas@kernel.org" <kas@kernel.org>,
	"ankita@nvidia.com" <ankita@nvidia.com>,
	"jiri@resnulli.us" <jiri@resnulli.us>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Jiang, Dave" <dave.jiang@intel.com>,
	"Quigley, David" <david.quigley@intel.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"pgonda@google.com" <pgonda@google.com>,
	"jpiotrowski@nvidia.com" <jpiotrowski@nvidia.com>,
	"Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	"lukas@wunner.de" <lukas@wunner.de>,
	"jic23@kernel.org" <jic23@kernel.org>,
	"x86@kernel.org" <x86@kernel.org>,
	"sameo@meta.com" <sameo@meta.com>, "aik@amd.com" <aik@amd.com>,
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>,
	"ksinyuk@kernel.org" <ksinyuk@kernel.org>,
	"qinkun@google.com" <qinkun@google.com>
Subject: Re: [PATCH RFC 20/20] attestation: Add the TDX family implementation
Message-ID: <20261109171236.GP663069@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-21-jiri@resnulli.us>
 <ed52bb6d48c87ab8023bf2165cadffa259e21725.camel@intel.com>
 <20261023141218.GD3977851@ziepe.ca>
 <343e4a12f2fdbb4e9a19c4afe49cf2b8908d6739.camel@intel.com>
 <20261023220030.GM3977851@ziepe.ca>
 <7843a833723e3aad40f8fc4de3a83f5a5059280f.camel@intel.com>
 <20261103005851.GH3889730@ziepe.ca>
 <au5LCE1jau0yDo5S@intel.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <au5LCE1jau0yDo5S@intel.com>

On Fri, Nov 06, 2026 at 01:47:52PM -0800, Peter Fang wrote:

> For TDX, the direction so far has been to keep the guest as simple as
> possible in the attestation process. So the "quote type" knowledge is
> pushed into the TDX module and the remote verifier. The host kernel is
> mostly tasked with transporting the quote blob from the TDX module back
> to the guest. In other words, TDX doesn't have any quote type knowledge
> outside of the module itself. And as far as I know, parsing these blobs
> is sort of a pain.
> 
> The TDX DICE blobs are actually self-describing, meaning the verifier
> can follow a schema, parse the blob straight away, and know what's
> inside, including how to verify the signature. They're also
> distinguishable from the legacy quotes. A launched guest is guaranteed
> to have a stable format for its quotes. So this makes me wonder how the
> labeling should be done. Do you think it makes sense to just have a
> "primary raw TDX quote" label and let the TDX quote blob describe
> itself? Also, I think currently there are no plans to add
> secondary/supplementary blobs alongside the quote itself.

I would be very happy if Intel came with some plan, documented in the
ABI comments around their labels down the road.

What I would like is that given a specific label any userspace can do
a verification and full dump of that data, including signature
validation, without need of any further external information.

Ie it is entirely self describing under that label.

So if someone has to say externally 'oh this was a legacy VM' to make
parsing work then that needs to go in the label.

Think of it this way, you should be able to run a command, lets imagine:

$ attestctl dump report0
   intel TDX A:
     - Field 1
     - Field 2
   Signature VALID
   Certificate chain
      A
      B
      C

It must not be something like:

$ attestctl dump report0 --kind tdx_legacy
$ attestctl dump report0 --kind tdx_dice

Does it make sense?

Whatever labeling you choose has to follow these goals, and there is
some trade off between making thing self describing forever into the
future and exposing protocol details into the guest kernel driver.

The future scares me so I would always design to include a description
of the blob from TDX module to the guest driver :)

Jason
