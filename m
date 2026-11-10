Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335252;
	b=AJuMMZrK9lxUpgJnPC6Ab2XHHO8cc5AQzR61A/iyg/ISLzj5RtdwoKF4V/tLvxaRbvPn
	 uQ3bengHNCxq7zgT/9HIe88FcS0kuKMgsdtRGgg7H1mwXp6IrhRDSq7kvgXJvKnqIOjyO
	 L6tj9UcHLWa8f4fCwHmHKeOdWADx0P5hJMKQCBfathnPfu+38uDE8K5y/LI2hvcpnXW86
	 2tZpRKrNZDa1onUW50GTfqyORtd4BdK7o7cQFLXL/Fv+onxS/Bh84m9F/Q/iytmfjJzeI
	 f5+H1qxjkQLqLbFedznWglpP4JJ62GNevzjzmcRVmywL/BKDKm4oYrRdRlEK6ephw4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=YXIy2qRY3m4JoNqfvZNIVm9KUne3fxI0qe7Yqqt3EGs=;
	b=WgZY2hpKYRnQMeMB1G25E4UN1Po6ARZa2WPmhyi9IbUGvmNJJvwGxCu2DPbR/jm9jcdb
	 oQTOXksUkAJ8Kymj6pVo6qxTHewGd17+jeEJGWbrFJO/GbpXt7a0lbV1PS3AryqERfag3
	 Q1gRdfhS/mgt9Jjp4rOGz/MyhM1S0k5WhpugYAo2wn9POD6GNnE5KeCuvwigoEY+94rAs
	 kVc3lSCfL++xz9QutT7AVkmF0emdl7WdjrNyxbUfDP6W07dU4RQ3rXfYFzZiKTDG3QngT
	 NBg5uUDZnxSdMv/Z2nD4jWGz5F7cZmG5gzq4erg0knBCJa/PyYd5EPPGfkfoew3m1TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F45606A325
	for <linux-coco@lists.linux.dev>; Tue, 10 Nov 2026 18:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31F45606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53644b28706so33439961cf.3
        for <linux-coco@lists.linux.dev>; Tue, 10 Nov 2026 10:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794335250; x=1794940050; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YXIy2qRY3m4JoNqfvZNIVm9KUne3fxI0qe7Yqqt3EGs=;
        b=fjKBvoJHEdk3zxEilzY60dibFOoUCWGC5K79cX/R/cwWsEk0rrOb2dJ6WMt9KYHO5j
         T5F85Tejd0xXrYabY6fJBJ3peW5KqKOMbFGTxs0IoJe/7kAJ9x4z/+PiPacII1VSmAKT
         k3iBItwDydFOMNMf/q8gTtvHApfJHJAhj5iTF/FYrWLjfp6REYVA4fdv/sO1GTdsnIMJ
         ZkNahAr8mrE8QPYBJsTt75DMA3ZJhhTkxpxgwMso51wOpRRqUtJHYzOkoDP2FjKmJTwY
         zvLHs9VsB1gMGd8LzEezdm3cjC93+8amT4bm4FNudFn6dWVblO1AtK1Fsv09nf6QsMrC
         zUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794335250; x=1794940050;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YXIy2qRY3m4JoNqfvZNIVm9KUne3fxI0qe7Yqqt3EGs=;
        b=rwHsPgttbXAyVXOx8/mLviR7voH/r1xP/JX8tjl+cUqH0xmzr8UfeP1Mjiqk2dxECg
         IPAkGYfEGRO27dmkxiPXh63G0cnxYT3Wn229T/ixaAmWFEz84VfNHHl3NAOdXMbqsDEq
         M/UXMJAfKTYHjEocuXW3iT6IcZ2Jobl0Y3weN2PbLAmraMeKEzyos1ElSvRcRLXCZoh4
         Yg0d1wUrBZVjrRLiGmEiErwrX/6E5eTCTk7a8eoVH3UHEEfi8jRpilR9jukq1JvFzJW5
         NERGaOb5RwJjhfjfYM8weP6syjdc4/9N6HQFKZO/miE5Mm3Ae2kqw/7/0UDoVP6z/ce+
         /47g==
X-Forwarded-Encrypted: i=1; AL+hErFSE1pTk/p7/XuGPzMIka46wxsQxGCRpw6hsudMIh2+U4zqzQC8IynsE6GekvPWxB73o50QRZbp9xD/@lists.linux.dev
X-Gm-Message-State: APuU4Z9GlwrNVoiNOvZAf2HRrg1Zk5iRyesg1r4WKNUgySAASOnrA5Ig
	CQWd7XevBU79yyJV3FgFIsf7weMk7S/0zYUx2tqsO3S/uH61IoOfXkZ0wHJL7tAmayQ=
X-Gm-Gg: AYBFou29znDS6GXrjERN2WaFK4cnHyVCBMJW/7jGPGfput40QrYB353ClPGps4+QB2e
	iOGnRlvPbdQYBOPlucR8f8wwXggU9yrkKyHJbxQTl7JE8DafvUajJNpPrHlKRLqhgxIlFK1Bbto
	8lq0rWfXZJ0c4OrUmv1vaVQQ4tBGaV3JZIRsUYbM2G9VYDkVu0RORqcKIWQ9roAcX0gxQsJIVCu
	t2FSgUKO52KMlSA+jE/DgTGNjssz6rti9ElpqdLz19aND6kFCgfa5yhpZz2ACKggIvBm4a3cc+0
	oq7AWc8yQ3G9XK6TTd0NMER40ZG0XU5bfkKFZDdRtele4X211Nganzn5+GeJuoHAgV3Mh3IKGgR
	VXvQ36ItRZazzWQgiTf7xOZocqg+5s1G/y7Ox7BtBBOU+Ni+V/2WjV7z54xp7fLN5deD4krL3Qi
	bpz8ZmxIaDcYuiKxnMKrwDPyOEFvbBeIA12LSrkFpdfTgf6ME4SzHc0mhk4e3SFWKMTiYCg5EYI
	42uYSQnil8rvf2XmPrIgH1E1K+7uAT46mDJqRrhxeS+hxcStwkoga7qoNZ3vCOc9HHz2i61nvRg
	QuMlEkD0iyQEjE237JSP7brpJgZwtI6YGhlI1dLTcXFkL7BI7Kj920r4GRGwoLLxfGZfFo7pdCa
	TxAKKoEEXDHc=
X-Received: by 2002:a05:622a:313:b0:51c:1590:8e13 with SMTP id d75a77b69052e-555257c5f22mr54402921cf.4.1794335250028;
        Tue, 10 Nov 2026 10:27:30 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-555093d9c3fsm30362981cf.3.2026.11.10.10.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:27:28 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xQqZ5-00000006j4S-49JU;
	Tue, 10 Nov 2026 14:27:27 -0400
Date: Tue, 10 Nov 2026 14:27:27 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peter Fang <peter.fang@intel.com>
Cc: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"drdeeglaze@gmail.com" <drdeeglaze@gmail.com>,
	"James.Bottomley@hansenpartnership.com" <James.Bottomley@hansenpartnership.com>,
	"aik@amd.com" <aik@amd.com>,
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
	"x86@kernel.org" <x86@kernel.org>,
	"jpiotrowski@nvidia.com" <jpiotrowski@nvidia.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"lukas@wunner.de" <lukas@wunner.de>,
	"Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	"jic23@kernel.org" <jic23@kernel.org>,
	"ksinyuk@kernel.org" <ksinyuk@kernel.org>,
	"sameo@meta.com" <sameo@meta.com>,
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>,
	"qinkun@google.com" <qinkun@google.com>,
	"pgonda@google.com" <pgonda@google.com>
Subject: Re: [PATCH RFC 20/20] attestation: Add the TDX family implementation
Message-ID: <20261110182727.GA663069@ziepe.ca>
References: <20261023220030.GM3977851@ziepe.ca>
 <7843a833723e3aad40f8fc4de3a83f5a5059280f.camel@intel.com>
 <20261103005851.GH3889730@ziepe.ca>
 <au5LCE1jau0yDo5S@intel.com>
 <20261109171236.GP663069@ziepe.ca>
 <cbef9bda9241ffe98652172edb67fab3eb1c35ee.camel@intel.com>
 <20261109234252.GR663069@ziepe.ca>
 <4c75b369b68c98c5c35e296895b6935342dc7dc1.camel@intel.com>
 <20261110131114.GV663069@ziepe.ca>
 <avNfZ0lLl-OrkCHs@intel.com>
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
In-Reply-To: <avNfZ0lLl-OrkCHs@intel.com>

On Tue, Nov 10, 2026 at 10:16:07AM -0800, Peter Fang wrote:
> > It is not local quote processing. This is labeling data properly so a
> > verifier is possible without the user having to manually and directly
> > inform the system what versions of Intel CPUs and TDX modules it
> > should expect to have.
> 
> With labeling like tdx-quote-sgx-1.0 and tdx-quote-eat-cwt-1.0, and
> enough knowledge of these labels, I think this can be achieved.

Yeah, that's all I'm asking for here, and it sounds like the magic
bytes are enough for the kernel to deduce it and pass it to userspace.

In future please transfer labels along with the blobs through out all
your paths so we don't have to parse magic bytes to know what data we
are holding.

Jason
