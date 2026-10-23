Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792760497;
	b=pyzbsTcedEtxvUfHyJaUzV04I39Ev4WDlOROQ6AFiqdE9+a4XZW2qfNcW5WDj0OzTlX2
	 mQdesqMRO8IYD6YonGqNYy56oDVj3FRtKvZ+Ch0vU7GeUy8gd/2Q0Kabd0f0rv5JcxsbK
	 HjBiUuVn53Mab11G/TEN5LVQj5Ax/TwkigxQ2qezn0FUOSQmLuhIJJyVNnSIZPzssUk1Y
	 XyyBTY96JuVodmVNx2m8+Plf+IoW8NvmiXA+lyZo19JbmCmr/um2nVw2iUGHcq5eo276S
	 zD2sUtHIbLOLPr9TN5FrT8Q/NBAyx0oIVesSfCU+FjRhZiy1bIpqV0kBLC0jmwQWvdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=1f6kYcZtrUYkUfjtStdqQg00V0eNduZavh/6mKW3Q/4=;
	b=PigtHyrAKtW8NWphJ1O0WPoPKljTISCj5nOsqTaLNkl94R+STkx6W3v7mS+qcOkbG7NX
	 Vrl9E8PNUqrKYOJRQeJdOuvSMUM/qmMMJyrkXzqngIJWADQlJCCGvP8VndTrz5/FQeVv/
	 2lk6yKJCDPRTJt7fupgDWABR79E/tGFOH9GGwPEyqp4JNyzxW5TFDhpkh7UqxLb1HbhhO
	 jgfZN1d8KK5VvwKpzrrv6VndHHLas8QtQ1NxQnKpFR+1sBcMqtZglDC0cAZcKUX6TsacL
	 JqsgVjlj44lGdkQj7SF0NJJo5fPb5BU603RILZ/Gos1oslpRvq8t/Wwru0uQzX0FH1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=suiztiFp;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB773606A32E
	for <linux-coco@lists.linux.dev>; Fri, 23 Oct 2026 13:01:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB773606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=suiztiFp
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48bbb06e746so464054f8f.3
        for <linux-coco@lists.linux.dev>; Fri, 23 Oct 2026 06:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1792760495; x=1793365295; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1f6kYcZtrUYkUfjtStdqQg00V0eNduZavh/6mKW3Q/4=;
        b=suiztiFpMAEbcPp17binAfZJfZb/PT3Gp6ZgSH8FqqYX6ApUX81Hnu7oEcOoRldXWG
         AIMS0/8BSXJaaRefVDicOEgiFO8CC0GLolfEFi0Tpw5e2MHmcPYEp/mJphoPUqp23cgf
         OWjBYk34fbU0SeaT1ilE5M0QBLEQXPjjYVOt8vdR19eDbp6t+9I782nKjU/VQsKa06wO
         3R1Xyo6L4YngOJXd6WsWOYI2ld1qoqIXHuXN3WBn3aAuXEjbrwRy1ffJNsQbRfS6CsIQ
         dRNw/aHsbn+Cm7d3aJJszSWch/xqOAnYS90jT0a9UzY7Erhy8YHcIj3E5c2kIuR0Lxz6
         uD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792760495; x=1793365295;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1f6kYcZtrUYkUfjtStdqQg00V0eNduZavh/6mKW3Q/4=;
        b=QfGz/26JkzCp3MHOVU+NMOrZBU564LsjEGZJUybv3jbDUI32fY15SGZ8Rc3g+qBx0x
         cgY8plbs043kA5qCLcpqwWOSzQuk/VR1VrRQ644pKxX3jZlaEQzMRVDq8awFi2or5cyc
         EUvz6GWQLolRUT17y1gui7sBUUdc+yKEg3JlOsCCSbb1cEzQfYnVLgdNHtdst5CEPIlT
         2/z1PAvjfvUDwCk/Q9eq4yJi9DrAg2CKiljVZMXdtA7LOGwJdMlQAzcQIl1W3vqTX0a9
         tdk7dW4urRNNY7zd2NJf1p1TjdlMFQ9iYAa36oFUVp+hMt88obAAu1DzwR0SDKN9xcrP
         pCXw==
X-Gm-Message-State: AFq9FYK5231Ry/plPgyCnZvPNHVuJk1JuadiRRLZ74Z1AwlTGU0sFmFh
	gD2J6jysAt91Fjj3LbnN0ToNSOHyWKiZqNn8YHxM1EM6yvUWXDuctovn8xTv7mhHh3gNkJNA1/E
	JRRlZ2580RQ==
X-Gm-Gg: AYBFou0FJDXwbO5X1zQz0bo+uJrzy2wgQ7Lp326Hb1lMvLMeaMmy+PFddoAF5XZC6pr
	wMwgZAyfuDkjXuAUFOQf7ibWeLk+7eucEHnIRvYECuQHjU+xGtfTAWYvSNngURMkH8fKAhDpeXO
	t9Xozll1YYyOzvjMM8Ajtj5GDnEjrhI2qmvJxw/zfkVu9te70C+a4wKMraLYfbtMgZdMnoQ+XNa
	INGO+0tcU8OVax4uHLB3PlLJoiUieSOjJvkKp1sOtgNUTZrmKHFtoN5n2I9iVrge0axmU1FKs/o
	6s7pco3C489wuiV85ESb0rxzgfQnBBmUmkuJkGfidV88dvRioxp2k1URpsXzbq/OHBBX4L2ob/l
	kZuDVA1fF6Of9HokLv0P0zWW1i8SCK6gHm5E4VbqwWeh8/JRmCqcDlqqHR7zFcBu6tkK1cGcoIa
	vjha2PaLdH7wloBVUI7UUir6cAUOfDi9S7V0moBMRunBdfRrEVOfv5G0QVlvjaBmHGtMHtrWjHq
	SazgCET2Js/PGs1/dQ6f1/XMPxGC/yTBQsGyvMJUVHnXxp3vNC/1C8aQF7tlXJ580o=
X-Received: by 2002:a05:600c:19ca:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4a211c8fa81mr35809955e9.8.1792760494721;
        Fri, 23 Oct 2026 06:01:34 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a29cdb75cfsm3940865e9.9.2026.10.23.06.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:01:34 -0700 (PDT)
Date: Fri, 23 Oct 2026 15:01:30 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 13/20] Documentation: ctlv: Describe how to write a
 family
Message-ID: <attaLkZFIGSKLmgZ@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-14-jiri@resnulli.us>
 <179245258505.58760.3972297562218204862.b4-review@b4>
 <atjEgLYpgbZNzfkZ@FV6GYCPJ69>
 <20261021144951.GR3008132@nvidia.com>
 <atjiW8bnqDZ8zb5t@FV6GYCPJ69>
 <20261021164857.GT3008132@nvidia.com>
 <atnGniIHxIV-vzVC@FV6GYCPJ69>
 <20261022192118.GC3746973@nvidia.com>
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
In-Reply-To: <20261022192118.GC3746973@nvidia.com>

Thu, Oct 22, 2026 at 09:21:18PM +0200, jgg@nvidia.com wrote:
>On Thu, Oct 22, 2026 at 10:22:55AM +0200, Jiri Pirko wrote:
>
>> >But it does work well here, and matches what rdma and fwctl did as
>> >well. So maybe iommufd is weird.
>> 
>> Well, one CTLV chardev is always backed by one device. I think this 1:1
>> mapping is clear in the device model. Iommufd indeed looks weird in this
>> matter.
>
>iommufd doesn't do 1:1 with a device..
>
>It is more like netlink where it talks to all the devices in the
>system concurrently.
>
>> >> Depends on the user/subsystem. Either families_dump op could be used of
>> >> udev uvevents that also carry family inheritance chain:
>> >>     CTLV_FAMILY=ctlv-attestation-tdx
>> >>     CTLV_COMPATIBLE_0=ctlv
>> >>     CTLV_COMPATIBLE_1=ctlv-attestation
>> >>     CTLV_COMPATIBLE_2=ctlv-attestation-tdx
>> >>     CTLV_COMPATIBLE_N=3
>> >
>> >I wouldn't try to link it to udev either, by the time some userspace
>> >uses the cdev the udev information is gone, and may be unreachable
>> >from inside a container or similar..
>> 
>> This just gives possibility for udev to work properly. Depends on
>> the user/usecase if it's going to be used or not. Not sure what you mean
>> by "udev information is gone". Udev might use these uevent info to do
>> aliases, similar to dev/disk/by-*
>
>I don't know if you can encode N compatible strings into a file name.

Yeah, the udev rule would have to have some logic on top of them, sure.


>
>And in a container or something you can't get the uevent, so no client
>software could rely on this information.

Okay.


>
>Jason
