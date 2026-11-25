Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616188;
	b=NwtKuw4JVeTgYcaJYNLLUKTzRGRsTWilJrPptFfpm/gZf2gmLX3qW35NzaCdc8DciQw6
	 9rQsQqUdRJjLRqB8CuKjDIujP4Tjts9E7GbT2rm5CqB2KHZVjOAk6pd9ZYDwq991O2rAd
	 Os2fpk9sRlbWGfl3AExC62PjzYGR+Lxn+4GTIOBGUTDVHeMTi+gHku2GYWUi+PDdGnVQ1
	 Pgc5uj4+stHRtgPVqpF/v6UZ9cRDD9N2FoclDkxu0U6gBVTQxnTLGKTea1j94Mydy2Uhv
	 PFSNgVsNMgb9yIvuMZiDwGOhGl7AFBGaSlIQzoQZg66KsIIrAmukxj8B31XkGyPVqTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=i/jrBB7rLlSUxUEPdi3kz4rjRXIQytYo5vvcwBrT/JI=;
	b=KsFzLINqfVseklml6Hh7KjvU11SNIj/uzRQcojgm+7m3vzv651SfCFleBZsAwoY5pGr7
	 PWj17CadgpxBMU7GATHLu/CuAtOfNc93MPfScnniH8lEeKmlVDHvQxP4/CrH72veaBh3I
	 pKEzM+v4Ac2RcmOxoPvDGRvuyXJt8aciUv9PvhZ3G9S6viE8UUusWyILwDcY8HdhgtHH2
	 8Ei3OaNGYsD6lSo6CirvVqIXBPBWLIt6K9vLhlA2YT10REaB+lNzcSLzMP1uHR4dVNlvg
	 w7S5tBnRXFDlj80elxMRliUmVnBRZsCBd61n8RuJbOXzioUMeEVs9mPR+keilLHYGHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=c6McCBIX;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BC9606A326
	for <linux-coco@lists.linux.dev>; Wed, 25 Nov 2026 14:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90BC9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=c6McCBIX
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91e8a05ec5aso78289756d6.1
        for <linux-coco@lists.linux.dev>; Wed, 25 Nov 2026 06:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795616186; x=1796220986; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i/jrBB7rLlSUxUEPdi3kz4rjRXIQytYo5vvcwBrT/JI=;
        b=c6McCBIXAxfLw4s25EbkG9zoFP6msVqRL8V5KjgDJW1iXYHyByTdPIShm5EPJyHos2
         HwZBtz5AE5GjelgQp6B/Zhb0DAQkNLCv6AfEaqixwvDdPBExor6wI4cXwkkMoohMs3vP
         2l3iUUCSdc7fr/zLY/FeUIn59HuCWN4yD3z10qeT1gK52npjipIEoOdqvr9x3E6FY38Y
         d5k9qyar+uFHNfZKFclxY1bjE6FW9WolR9X3V01NkN7cGQv9/wPIFZK/YIbySQECPiwM
         +KqDqC8m6N667bfunMih5yEBJ2CYftI1JGdOMBJLuL2OEWiJGFZekOIEnyYLCVQ+NgGj
         VyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616186; x=1796220986;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i/jrBB7rLlSUxUEPdi3kz4rjRXIQytYo5vvcwBrT/JI=;
        b=rThKNOcpuPuYS4tM2oVGKC1Nc9IuSGvIkExGfdtYn7i8JDGnXyoR4g5ThjdLJrfeKl
         isKWJpjHO3w/ejmJdKkNbV8vwFZ04sOGkkaM192SXqCRxKe6/BdT+a7YCuU6GOfKthQ+
         NhToSlMSDjoOiBjNu0GDWj0HC5KbifPzxQn+hLYtTnLKTW8tzZGu6mZf9cu07Cd+uWUX
         Q0R6g3QrBHdQvICG+VDt1+NYc8SUCzBjc0WnRwjSffyP1Sa2hoLhdcpm2BmFHSGOEtIf
         KUcugXc6rpjGY59I+EJ9TliCqUV67j2MjpjflLeATa6A7vO/ouC4x/mixx0SFOX+DA5i
         PT6w==
X-Forwarded-Encrypted: i=1; AL+hErHd/UT9DHnnm8xiCnt/zLzKx0vLhB6ROMqUykiwLpAsbHmdaxTa5ImNICGrKkMyAaICw0B2rzYM9t5Y@lists.linux.dev
X-Gm-Message-State: APuU4Z9mve0zZDdlLVh6CogwVf0zX0Lg+RAN/rKe8z8NSZ6XcXEKAGfr
	EVxLf7v9rnZDw/WcvpfdPscwuLKCV8o3LfIw18+sMM6eP6ov8Zoqpu/aUENjBvnKcm4=
X-Gm-Gg: AZFdTZd8nhZZtzf9OQkDi1lRrJoKSWcQ7r9VRCgCWk0kjiOFpTTX/NBp0aAijdajvxW
	gQT3Z8qNqOdGnpLxJDQssX1Ozz/A6Cho85YCvpGj6ia88e7eLdX1qm2xE4UpDNOKdUolY94bHQg
	EdrV7mox1UZ4hdeBXRTDmfV/FrTQ0aOEusjKjTpi8qRC+CvtWZhiptIwJfDdtSlw9jH7TSMC8R2
	6sgslXzHwmDDKiTz2Y8ix52T41p+mMF/VCRaAegEphI03KVOtEghiyxoL4DV1rzs1VCNGoetfcm
	JP/xBKyMeIzsaKnrcLPYaWMN+vevPrM9BjEELY75durGb66yDxqlluxYx8bQAYVeKav4kkfxEHS
	rBjTGS6HdtYVBZMlhDg1wPD/M4mxCnF3VtXLSJC86Ww1BFtdfx8a52eJvbSvOMq4kMYIHK0LHHI
	oMtGcbnG3m/0Hay0qCMhvJiMCBggZEAT0moVGo/6bXqLVr/Tbi/oDqcNeldXpsRWsGc/XfemTlE
	c74roUm4LeKQWO+jR7iytbqRM8i9Ss5BmGWIbedqjlikIl8R31M4diC1AO5dh8FJCz30l0drSz9
	J0R110hmakoe51R3aSZmPP1HxUU=
X-Received: by 2002:a05:6214:2f08:b0:921:5102:6b02 with SMTP id 6a1803df08f44-92151026b60mr217389976d6.38.1795616186267;
        Wed, 25 Nov 2026 06:16:26 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9217fd18b2asm6696336d6.21.2026.11.25.06.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:16:25 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWDnN-00000001jAp-0WzE;
	Wed, 25 Nov 2026 10:16:25 -0400
Date: Wed, 25 Nov 2026 10:16:25 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Alexey Kardashevskiy <aik@amd.com>, linux-coco@lists.linux.dev,
	Dan Williams <djbw@kernel.org>, Leon Romanovsky <leon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Lukas Wunner <lukas@wunner.de>, Ashish Kalra <ashish.kalra@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	driver-core@lists.linux.dev, linux-pci@vger.kernel.org,
	kvm@vger.kernel.org, patches@lists.linux.dev,
	Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v1 01/10] PCI/TSM: Report active IDE streams per host
 bridge
Message-ID: <20261125141625.GA246011@ziepe.ca>
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org>
 <20261123083337.2731019-2-aneesh.kumar@kernel.org>
 <f377271d-353f-4c8e-94d5-98159a66ab28@amd.com>
 <20261124024842.GB9566@ziepe.ca>
 <yq5azeux9xxm.fsf@kernel.org>
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
In-Reply-To: <yq5azeux9xxm.fsf@kernel.org>

On Wed, Nov 25, 2026 at 12:53:33PM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@ziepe.ca> writes:
> 
> > On Tue, Nov 24, 2026 at 11:11:49AM +1100, Alexey Kardashevskiy wrote:
> >> On 23/11/26 19:33, Aneesh Kumar K.V (Arm) wrote:
> >> > From: Dan Williams <dan.j.williams@intel.com>
> >> > 
> >> > The first attempt at an ABI for this failed to account for naming
> >> > collisions across host bridges:
> >> > 
> >> > Commit a4438f06b1db ("PCI/TSM: Report active IDE streams")
> >> > 
> >> > Revive this ABI with a per host bridge link that appears at first stream
> >> > creation for a given host bridge and disappears after the last stream is
> >> > removed.
> >> > 
> >> > For systems with many host bridge objects it allows:
> >> > 
> >> >      ls /sys/class/tsm/tsmN/pci*/stream*
> >> > 
> >> > ...to find all the host bridges with active streams without first iterating
> >> > over all host bridges. Yilun notes that is handy to have this short cut [1]
> >> > and from an administrator perspective it helps with inventory for
> >> > constrained stream resources.
> >> > 
> >> > Link: http://lore.kernel.org/aXLtILY85oMU5qlb@yilunxu-OptiPlex-7050 [1]
> >> > Reviewed-by: Xu Yilun <yilun.xu@linux.intel.com>
> >> > Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> >> > Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> >> > ---
> >> >   Documentation/ABI/testing/sysfs-class-tsm | 13 ++++
> >> >   drivers/pci/ide.c                         |  4 +
> >> >   drivers/virt/coco/tsm-core.c              | 95 +++++++++++++++++++++++
> >> 
> >> I'll take to the tsm tree, thanks!
> >
> > Lets not take any new sysfs APIs please. These all need a careful
> > thing and we are not having a good history right now on any of these.
> >
> > I'm not even sure what this is supposed to be for, is it debugging?
> 
> 
> I think this helps users identify active IDE streams and determine how
> many secure streams remain available on the host bridge. I would not
> classify it as a debugging-only aid.

It looks like debugging to me..

> A sample output for a toplogy given below
> # lspci -t   
> -[0000:00]-+-01.0-[01]--+-00.0
>            |            \-00.1
>            +-02.0-[02]----00.0
>            \-03.0-[03]----00.0
> # 
> 
> # pwd
> /sys/class/tsm/tsm0/pci0000:00
> # ls
> 0000:00:01.0  0000:00:03.0              pci_bus  stream0.0.0  trust_policy
> 0000:00:02.0  available_secure_streams  power    trust        uevent
> # cat available_secure_streams 
> 255
> # ls -al stream0.0.0
> lrwxrwxrwx 1 root root 0 Jan  1 00:48 stream0.0.0 -> 0000:00:02.0/0000:02:00.0
> # 
> 
> Here, I have set up an IDE stream with 0000:02:00.0.
.
> The previous discussion cited in the cover letter indicated a need for
> this because the number of streams available at the host bridge level is
> limited.

So explain how the imagined "systemd device acceptd" is supposed to
use this automatically?

Explain how it works with the future need for a more complex P2P
scenario

Explain how it works inside a guest to accept IDE streams setup by the
host.

IMHO we are no where near understanding streams well enough to have a
uAPI implementation, nor it is even clear sysfs will be enough to get
us what is needed for everything.

I would prefer we focus on the things we are starting have a consensus
on, there are so many right now, lets try to get them merged before
opening up even more topics.

Jason
