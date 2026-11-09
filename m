Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794267776;
	b=LG+5rM2MGdeqZN/XpjxWwI5n8yzYuwHfpXkqfq4UFsqavIzKXsI26z1ut1q0h0oKr6+1
	 zczwYyD/Rz4qqo08VsTkrCqlj2B9ryCowT04wKCR9U/DZIXbsEYJ+21aRcFfKd0gNUR+D
	 eIEAPjQ/OKOgWLwMJHdHAhfu1VoUrAvSJYXNtAhqcX/BrgjB0xl6sxRijIZE82ak9rhNu
	 W34/LhELEtE8xddyUO0GZgB3VWTZxfW/FavTrnY+DGDoNrN8Veh2YYcHvEhShtL2zHQ21
	 QIsb4bCASzQXReumUwYtlGpdwO8fRTiQ/Vc93xhVKhHtSLm56qEB9NmV4fCkjD+QcjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794267776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=sa2+WBgF5hKTZoECa+jNwUyW/NRKAyVaKXS151Xizdw=;
	b=0gKfNEtZfobqvSRElurM4MkNP30nR1970GgKBjTXUGLstzcBZLpxoPxhK1cVOA5gEiyH
	 +mnAazVvg6FYP+ui//Xk5YLhhvPdlTXRXaMj3t3L6iYecXYC5cEUU2jX/XqrXw2cz5TAV
	 Gi58hw1Xa34AGk6TQJ/9L5zy31YhrZWQT+Tc1g3bXv7YsfsE3yCT4cYJF0UAfe2o5vduC
	 v+ZqG13d+AY/6t7u4gRaQ0ZCvi7e7WUMLclSY9TEFiuP7EoenkrJajqhROGlTrbeyosFF
	 Xv7hPfrs662IpSxoPwaAmQoOp/NwS+7Io+lXq7V2nFg0aUyMEmVCK6CZgbqlsVgSsDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7409606A32A
	for <linux-coco@lists.linux.dev>; Mon,  9 Nov 2026 23:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7409606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93cc1ab5f6cso180010885a.0
        for <linux-coco@lists.linux.dev>; Mon, 09 Nov 2026 15:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794267774; x=1794872574; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sa2+WBgF5hKTZoECa+jNwUyW/NRKAyVaKXS151Xizdw=;
        b=glRHLQr6OEAeDn0cAUliCVWGoLBCuL0tufqCkaTzMPf73BjWd1C1l7u6WSO1udrnIZ
         oGDGt+M+EWvB9QCixMHIe8v5gyaYmlj0bPdrhJpLCyJ62DYTu/uaiUeaZ1vuCv5J29cf
         a/JJgbhu7kKrT6Lf4O9VC7gUADjCB80xmNapZPIhQqfUB1b2N2tK2tJuRUEJr2hgzFzH
         yRaZWUyb+IRMIlqNeLqjubVU7HZvHa+p5Cx7gYyRxYD2kPXwgQZd4ISGWcMzjMc6J0Sg
         CjaxTIWw/+jWDUjxWZfd/NfT8FWvaY/2HoYom6qYwMKRO2JrTsLX2HP8bu6GPI2+OgZk
         cDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794267774; x=1794872574;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sa2+WBgF5hKTZoECa+jNwUyW/NRKAyVaKXS151Xizdw=;
        b=Rqgp5KNTWFGdbg/RGLODEdY+mAZSG4lH0/OuHXnrDTsjSP3kIRC6FJayNPFP8UH70Y
         V30byHUH02AZTC7U38osi+L+NIn+CvqJlgl8YNlCfBswfr/slKQd0a7c6vjGho1BdThn
         pb5KImaXNZhwHcc+xXvFhicGtoRud4A9lIwPwJtkHiuxObUhNJWrxjDKhhvap2KuYOaJ
         MBwAPx7LD2xj7mCqixRS30qk28YxxqqX3gubL1I2F8PLJkGnVlkoAeLfMa7+C6uS+sVH
         q4EbDf55+TDcRQ+LglWG05IRie9Zi/e3TcsCmIaBeUgDYx9yZnxENYsPj5ANI/cdwvI7
         N2SQ==
X-Forwarded-Encrypted: i=1; AL+hErGi9xOy3Jg6zl2j593UueMmOHEkY0J/NNu2riKBZkffnH/r56hb8X8FT9fZpuHwWVVuw7Aawt6k/4Et@lists.linux.dev
X-Gm-Message-State: APuU4Z8nJHQVo0Rk6FhWDXN/h/Rss73gsNfEL1L3tOH4RLx3TSdBjR68
	XjTGFQz6HK0f4XEXfJBb2qq1oI6qWJjElziWpRorm8YOe9BlTbFMwbhiTN+oyNkaeMU=
X-Gm-Gg: AYBFou3rpSpPb+JUHLA4IH7SeFW75Wbvu4kGPivJUpLpkoFRnFQEvYa+SHetLNquDkD
	J1GV3MyMmeFNWTlssc0fW+vLFe4NO1baSEtvdlAboV4ByApRvb6uOv6ug8oM9fVpWfFRS/Inayv
	vspoFEeDB3v8e8YgrPzIwzTS6U/JYaCxLplgrNOJehVNb9n5gxm0iIGzisXADbdlfqKSA7PmTc6
	06XbDkv1Qb3HOe+YdNacOgHYuqbXkMajFSfJetr19ytMM/tufj2y4wV0CcHqlkkrLcwwnv2fTYo
	Zb3XOePyMUCVCH61+BoZTtSt+JlneCUp7fiiV93xg2fc90D1fC7mPttYLZ/cP1Z7+nRnVUwqxXt
	Xm7q4brA8h/5cFy2eETbs09gAxAS0E3rJO+G0cID7tGiIx6pFy/O9TfnNbSL418V44EY5Z2wNGp
	M0afPmfiiPNK67lRBm+einv48GIftCV0cqsCIHUr5kTK/0j2Sq0+kPCgU3Pvy+lPln5KG3U8Ct4
	v2m/LEcj3BPd5MULPixeIzinprKZHYOVcXaZtykAya0bnK/BXW/7E3cR7o1oQXiIqJjZKd+K1hj
	0ffkmjRs8zl1YMe5AWxmzOSYrl/T5kKIDJNpk9T/s/jCMbly+y6U1vtKqM2YNwJVfkKqIXBvq9a
	+B63cLuI17Q==
X-Received: by 2002:a05:620a:2725:b0:93f:4cfb:2a8a with SMTP id af79cd13be357-9479f2fa688mr176463985a.26.1794267774479;
        Mon, 09 Nov 2026 15:42:54 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e784b90sm91815285a.22.2026.11.09.15.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 15:42:53 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xQZ0m-000000033Ka-0GQE;
	Mon, 09 Nov 2026 19:42:52 -0400
Date: Mon, 9 Nov 2026 19:42:52 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "Fang, Peter" <peter.fang@intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"drdeeglaze@gmail.com" <drdeeglaze@gmail.com>,
	"James.Bottomley@hansenpartnership.com" <James.Bottomley@hansenpartnership.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"Xing, Cedric" <cedric.xing@intel.com>,
	"alistair.francis@wdc.com" <alistair.francis@wdc.com>,
	"linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
	"Reshetova, Elena" <elena.reshetova@intel.com>,
	"ankita@nvidia.com" <ankita@nvidia.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"jiri@resnulli.us" <jiri@resnulli.us>,
	"kas@kernel.org" <kas@kernel.org>,
	"Jiang, Dave" <dave.jiang@intel.com>,
	"Quigley, David" <david.quigley@intel.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"qinkun@google.com" <qinkun@google.com>,
	"jpiotrowski@nvidia.com" <jpiotrowski@nvidia.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"lukas@wunner.de" <lukas@wunner.de>,
	"Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	"jic23@kernel.org" <jic23@kernel.org>,
	"ksinyuk@kernel.org" <ksinyuk@kernel.org>,
	"sameo@meta.com" <sameo@meta.com>, "aik@amd.com" <aik@amd.com>,
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>,
	"pgonda@google.com" <pgonda@google.com>,
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH RFC 20/20] attestation: Add the TDX family implementation
Message-ID: <20261109234252.GR663069@ziepe.ca>
References: <20261015145053.3664509-21-jiri@resnulli.us>
 <ed52bb6d48c87ab8023bf2165cadffa259e21725.camel@intel.com>
 <20261023141218.GD3977851@ziepe.ca>
 <343e4a12f2fdbb4e9a19c4afe49cf2b8908d6739.camel@intel.com>
 <20261023220030.GM3977851@ziepe.ca>
 <7843a833723e3aad40f8fc4de3a83f5a5059280f.camel@intel.com>
 <20261103005851.GH3889730@ziepe.ca>
 <au5LCE1jau0yDo5S@intel.com>
 <20261109171236.GP663069@ziepe.ca>
 <cbef9bda9241ffe98652172edb67fab3eb1c35ee.camel@intel.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cbef9bda9241ffe98652172edb67fab3eb1c35ee.camel@intel.com>

On Mon, Nov 09, 2026 at 11:20:22PM +0000, Edgecombe, Rick P wrote:
> On Mon, 2026-11-09 at 13:12 -0400, Jason Gunthorpe wrote:
> > I would be very happy if Intel came with some plan, documented in the
> > ABI comments around their labels down the road.
> > 
> > What I would like is that given a specific label any userspace can do
> > a verification and full dump of that data, including signature
> > validation, without need of any further external information.
> > 
> > Ie it is entirely self describing under that label.
> > 
> > So if someone has to say externally 'oh this was a legacy VM' to make
> > parsing work then that needs to go in the label.
> > 
> > Think of it this way, you should be able to run a command, lets imagine:
> > 
> > $ attestctl dump report0
> >    intel TDX A:
> >      - Field 1
> >      - Field 2
> >    Signature VALID
> >    Certificate chain
> >       A
> >       B
> >       C
> > 
> > It must not be something like:
> > 
> > $ attestctl dump report0 --kind tdx_legacy
> > $ attestctl dump report0 --kind tdx_dice
> > 
> > Does it make sense?
> > 
> > Whatever labeling you choose has to follow these goals, and there is
> > some trade off between making thing self describing forever into the
> > future and exposing protocol details into the guest kernel driver.
> > 
> > The future scares me so I would always design to include a description
> > of the blob from TDX module to the guest driver :)
> 
> So we have this SGX based quote format that is fixed because it already exists
> in the wild. Going forward we are moving to DICE, but that is a standard format.
> So also somewhat fixed. I guess the question is: is there some combo of bits in
> each blob we could check that could deterministically distinguish between the
> two? To do this we would need to analyze the quote formats.

You guys really didn't make it discoverable when you added DICE? :( :(

> If there isn't, I'm not sure what we could do at this point. There is a library
> Intel publishes (right Peter?) that can verify the quotes. I'd guess it must
> have some way to distinguish between the two. Can you check how it does it
> Peter?

See this is exactly what I'm talking about, I don't want to repeatedly
get into this situation down the road over the next decade.

> Another option would be to teach the whole stack to request specific
> quotes types from the guest. Then this new component could only
> request DICE and never be surprised by SGX quotes.

Is that an existing option? It seems OK?

Jason
