Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792765596;
	b=hd0szHxkLcz8BQgpDhzyYebm7QliSbgi+opiC1y29hTdAdCqoMQ1QllmmBXm5CYlQaMS
	 uqpArpqQrvzP+QogQypyKxw1IM/Po0Qp1MAFkVvZJcp1d0HCEVi+Ey22ntK3pv7Sk8bfW
	 2xJw9bUF9KH3uJNKBxSELDfXZ3mRmTaEAGtm24j0OAaSylxgQJBBIzRhiMpQh18cGu5WZ
	 ZfeVO4Dg2GDWvJXY3w09MTHM/91m0Dz/XLhEhs0Sjcbei02Dbm2oDHcWYfDpCs2sA+a5n
	 fKC5hfzov6unyg/YBkoSbarbzFm1KwoWf8KHsBm+jl64Sl1Gs+8KHMc6oIp/yhll7Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792765596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=0RgIg1l+3ifUtXqxbecqEIvcyWwa/dmFWxjX5pMBv2k=;
	b=a7eV4UVZGFUhR2RwX5o63x7Hr29YlDGy6wcGLB+1Fgmr9vn5sRvbcUES8Ef4s3upQE9q
	 AL0ti4bCnEWJjj1G0Y2ut94IQrrCU5RzMq7udIXK1WAHhD1nV9SiUB9f3+rJZTUDbx0XD
	 t1vl+0llUIjVyi9DivFHm+N8JHXbwf18+zHGImNe3W3L5qGilYQ9Cm20WoV9xgYIRcz52
	 KhRDRgw4VZZLK4erVkuKpqdQKccOTJ+1wkQ0tyhfRYeQM+bm1z4tcltVGt5bITMB7E2aH
	 MELFNhoMAVmLbOdArZOmrOM0ckUwxMdDwpsof5bmMpOvNgyTEcf5G7k7Ey6FIHtHXoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Li29uAtx;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EE0606A31F
	for <linux-coco@lists.linux.dev>; Fri, 23 Oct 2026 14:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34EE0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Li29uAtx
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-536c8f958d7so3413271cf.1
        for <linux-coco@lists.linux.dev>; Fri, 23 Oct 2026 07:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792765595; x=1793370395; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0RgIg1l+3ifUtXqxbecqEIvcyWwa/dmFWxjX5pMBv2k=;
        b=Li29uAtxW2cCbbhnPgAA0SJoSkjakgr9OIdp0egC87UiaedybOHcS12xJ5ZtZvNpk7
         2LKC8+/+zGaseF7ZUOuG/xh/JP10g+k4Oh2l52cz1/ETbIkek4jyqeVv/AF89z2/6BoA
         5Ec9pVgvaxrEprSbhAkr3SSwZrbqegXvbFr27fMhK5YeZ6ocl3Ykgmtfz2/es88f2i3+
         6UJk5KL1raFUrLg3GcXP2nfTh5ff5ogCWGnlOrB7+bnrkVvYPCJFpQKET0moFvZQGECb
         a3EB0qRXCyJZ7pTkghXEX8gippuy/G8hNjep/oJOEdbY0iGawAy7A7HB7zK6T2pa+BIo
         VQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792765595; x=1793370395;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0RgIg1l+3ifUtXqxbecqEIvcyWwa/dmFWxjX5pMBv2k=;
        b=FcGZBoL0d/uGkELRGvXLx89a4u3t5/CdCESfpCWKpyaywKsZBdc+qXBgAmrVksAUZ1
         NKG+lvaFNQ+GrBheN6gRJ54wbq0d8GVMBmPUVmUu3YNAHXTAiaVPiotfA3KvScpDaRiY
         m5j5dMOLIghuy7uUgj5ZSdv92iRWhp7sTambxULWQo4rrn8g5OuYg67Q3EDKJLByiPJl
         yRHqMVpq8oAnvrpb4DdVjH/5rbM/AZkusMngPNHe/RTYz16kkVDHFR3CLMQVPT/l+EUw
         bu2vEUqVMGSdGwF2U8/ZiKH8vEGtWjx911Ka1/tMwFDf24BzHG02KldbicGXK1He9OiT
         DQHg==
X-Forwarded-Encrypted: i=1; AKwUvBx65w3hHtqCR55lUL5mW2jYzcfnktXTMwWMAR5BPHzuYhI1Ggss45iRF4lhgduOPKAxQvDFMmtYRx2J@lists.linux.dev
X-Gm-Message-State: AFq9FYIn4TrLg6RcnHyRMGrdtfwPyRoJVXbxJKVJwDoWsPbTdVYUaIoX
	fOinxqdpMrzA/b4pk7yh7FvuIiO0jax1mI3Bk1Xz2B6m9rViqIZ8S54O1cZZ614P+4k=
X-Gm-Gg: AYBFou0z+TO/vJY9MqwU9Tz6HzgbtB4lWg1VDXGFFNa9qHD516WgqGpykW9V55wBUcH
	Zon7+1/8Vj9YoiHPk33TjRmk5HEC838p+LyMvz6lNOEniCCSUgHSc0BpR/+SDT+T/9JGn82gGAT
	+SybwMntQLTZJ3BgQDyzZ/AdqsyLt4y680JD5Chy9RHDSLHkS4NVRgqydkEO09N9oSpcrVFDhrA
	5K8B+SdcYrhNMiVngFCl9IjoYepbOn1LD3kZ4QRcprkPPYB2+DX9sm5+6pBJmzlgAoculMC6rxg
	KWGyuqq3un/xjpDOL9cuZJQeJDSUw/cNP5CvhIJ3Lt61PYMpwDA+BBWFItTqG6LTiZnXTREvOYX
	ZnXRk1rOI2JYJieS8gz+Y8ZblcwmxnEpfwWSCv+8S6XThiWt1Ee5kMDH8u3gVhBnLLUMlnj5iJq
	YmhOzKAhnzdzaFQMkow+PrukSXXZzv2ST0oeyj5BeuVR0FKJ8SupHgef+LqlG7PoR1RluXr1rzg
	hI4wnLSB0a2OJugTypY/iYWSKoxPCJv2MWnLOkTNq43sEL3mcOPhKmVRW+/MJ+3T3xa5fZKv0FK
	1ydOS+R/IJKntvFyhaydZf65ALoO9h4Na3IEKw==
X-Received: by 2002:a05:622a:5b93:b0:535:a5fa:ee02 with SMTP id d75a77b69052e-536c2700643mr30249831cf.66.1792765594917;
        Fri, 23 Oct 2026 07:26:34 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536c18afef6sm17177241cf.27.2026.10.23.07.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:26:34 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xKGE5-0000000GjLW-1mzI;
	Fri, 23 Oct 2026 11:26:33 -0300
Date: Fri, 23 Oct 2026 11:26:33 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jiri Pirko <jiri@resnulli.us>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
	x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org,
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com,
	drdeeglaze@gmail.com, James.Bottomley@hansenpartnership.com,
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com,
	pgonda@google.com, alistair.francis@wdc.com, ankita@nvidia.com,
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com, dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 12/20] ctlv: Add device and operation dispatch
Message-ID: <20261023142633.GF3977851@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-13-jiri@resnulli.us>
 <20261021022505.6fe1b1bb@jic23-hlaptop>
 <20261022184313.GD3381610@ziepe.ca>
 <attZl_0TNMDLgi4U@FV6GYCPJ69>
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
In-Reply-To: <attZl_0TNMDLgi4U@FV6GYCPJ69>

On Fri, Oct 23, 2026 at 02:58:33PM +0200, Jiri Pirko wrote:
> >> Jason did some nice handling in the fwctl stuff for
> >> device alloc and hand over after device_initialize()
> >> (I've copied it into a few places recently :)
> >> 
> >> I'd like to see something similar here as it made
> >> it easier to follow lifetimes etc.
> >
> >This is really at the wrong layer.. Attestation subsystem is the lead
> >subsystem, it should be allocating the struct device memory and the
> >driver should see the typical
> >
> >  struct attestation_dev *adev;
> >
> >  adev = attestation_alloc()
> >  [..]
> >  attestation_register(adev)
> 
> Er, the driver would call attestation_create() which will be a wrapper
> of ctvl_create. The reason is inheritance chain and each parent being
> passed info to and doing its own init()

We really want it to look like the above so we get proper container_of
stuff.

struct driver_attestion_dev {
   struct attestaion_dev adev;
}

driver_adev = attestaion_alloc(..)

Don't want "create" to allocate the memory, it is upside down. The
fixed memory ctvl needs should be buried in the attestaion_Dev

struct attestation_dev {
   struct device dev;    // sysfs dev inside class attestation
   struct ctlv_XX ctlv;  // ctlv instance
   struct cdev cdev;

   const struct attestation_ops *ops;
}

That's the essential skeleton of what a subsystem should look like in
linux, ctvl shouldn't co-opt it, it should embed like cdev does.

Look at fwctl for reference

Jason
