Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792599860;
	b=Jjz3Ws8wedg4vshjUiHjOQP+QgitWviZQRnWp7BiRndING9mXrJsgPQwItpd3lcXoWJp
	 JwNc/0zppXWAAZIFaCJ1hrIIVEUuQwDqgwW/VSudyeSOBuv5vqcTDf2yJFf0japt+p8XF
	 JxAS2rEsEJ5e2D/7UvD+OZIepTi/p3v9Po7yo+NwkYrtUR474JJLenJ2p6tZpOhnlkiN2
	 1QYyNFMUT8RS8F2PotGoA5PlBRLh4CxU/ffoRK/NrirEb/V6zHAhBorALQx/pjLUhXzJQ
	 77QV8/8wdA4ViCi5CFcKRnIwjWpJ8rCJlGKb7c0sOB8Aw67cyQzBRP25ddY8/fzJChQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792599860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=J+d1lI1CTytiZQns3U5FyUF/mcA833hGCvYKT8aAybo=;
	b=FMFr/0cEUn8t2Iy0qQrnGRbbyantO+VNUpGyY2PEboZ/cOfGirkhZnK361+5/4UXGVX+
	 lEkTXcrZVzbR8rcRjdoxGGd/+ZiumrT9rLvcgsyVLilBOHYcKvOh8PvbXzTkEEkkA1Vhl
	 bqACmgO6n8yy1jwwAm+ymwB1vQle/DI/zziSXmCHQW5oscVXnMyhKydewHqp+a6GvkoE7
	 3lFbBJz2JCmd8fjCac6qe7FM/qzwT1E9UF9yuSjsX3DHtgqu0nzm+ISGixPa2RzFDvJv4
	 w/FSlaIkhqvcCyUH/PgJ6LraHTwNldAJCCJRLcD7Nzwps/edzRcs9bVpmAqVQ4Jas7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=s9b7RjlC;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB74606A31A
	for <linux-coco@lists.linux.dev>; Wed, 21 Oct 2026 16:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BB74606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=s9b7RjlC
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c445c95d553so120954266b.1
        for <linux-coco@lists.linux.dev>; Wed, 21 Oct 2026 09:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1792599857; x=1793204657; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J+d1lI1CTytiZQns3U5FyUF/mcA833hGCvYKT8aAybo=;
        b=s9b7RjlCSsviJIpPU5gLDSA8/jjHgc5Je0M4OjD8sePce4y7FOUcna7AOX1UY1m1He
         ApemqNdnlD/OG3+bED8Eoqq5pNTaSYEleje8eIRbL0HDa86nuDxQ/UbMIjlsPs/pAIqf
         46DkUowISQg6PlqfpGy9mRF+G8xLT9O5DiGqvkMURlcsaq9zhCMoi0FcknHon5PE+ch9
         xEwJ+KGBoSuhU++fCFTVF0z6r/Q6duSmGHcl6k61GsAaoVgJJNeoL3A26GdBPQTuLb0q
         4VR18AOIEYP3TGgQsIvzkmJLUFsrucvEtB/Enq4Tb3Hba0+R3gELBuiebQYF53vev6k1
         hnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792599857; x=1793204657;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J+d1lI1CTytiZQns3U5FyUF/mcA833hGCvYKT8aAybo=;
        b=2WpWkEjTfxJCBp2eHhPbaLQ/QZN/3AAaPsAFFfCczDrnBoZmVMWFDZpsV21eqobR4i
         JnC4Dc/r6qZs7iblxEGmDVZnQfY0nEZiewgxVVZWxruVHdb0KDERVRUF1dZjceFAHHN4
         TTf4J2oSZJc1phoBvyFA2sXpmtUGLATN5kbKyH70Ry0zC6tC3HFCSRG16e4tKDYmeVlk
         ifRzti36ibeu+BgXuOKEBO1DPAyDrtppeWaj6IwFHHMJBtY064hTgeRDXrLEbzEQCztb
         IjBlcMC8cfCqXYSrBQS21xyfXO/P6ut7ovZNbdB2zN5txvg/gOH3l3XiQ6X+JTGjUKvv
         8eqA==
X-Gm-Message-State: AFq9FYKzE+4I3yd54iSwxzkGuc/H7PHzFH9jrkCkl945Ir3JotkY2hIT
	hqOyeRG1Ts+rzMpyOIg/4c+90RW9wqxDWjq/kRktZe3AYp1R08RnW+TgaSlcqRsHtdk=
X-Gm-Gg: AYBFou17Rs1i+dJtZIT/9WTkzpNczDnciyC6+JLyYbeR6oIX45q2RKPkuv9cypinTo/
	/t0mUhrrldotWI7R9OcJg1AG7sWCsBT44sMywQhcunKnfnRcousK+ySD8dpVLCky24G/BByxjAh
	xIZkyGM2oUDfRjWVPdxzk73lRuRaxGA5PVKfaxnA0TI1l0Yaj1Jutn8zj9e+9+B2TGqCIjyTTP8
	lBlBS/UQBUvEblDzc8qimjYFF9ECNDQy8+whgBjj4Kar/rJaEaNdcBrNU0B4tv8XRvXiOG9UxMr
	sDFxUcRbp267CcWnMqNG7aM1Cz0QvtuH2KpRHxze5DmU8AiON2oAPFery7NZOOUok+qCONrQymP
	2aP3pDswwlCKWgY4nAobWMW+aKb2MK3fi/Ol/wGmd+LvoLHOVI8O5v4oUIzYDT4xAGRIN2nR9b5
	Llb7YZiuOH50dxbbjpD/wh3/a9mmfAXXctCpVD0jDSB2JSGuoV/E8RPu1uvIDf9pMkwec+IataF
	tRJgrb9kNYgSnOiP7FusteYgvBZOg7sRHPMVDvJr0DvBgCXL80/hT9G/F4nEQK0Q5if
X-Received: by 2002:a17:907:2d92:b0:c25:afb6:2d91 with SMTP id a640c23a62f3a-c46791a97a9mr240205966b.2.1792599856528;
        Wed, 21 Oct 2026 09:24:16 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a4ffd07sm18747466b.17.2026.10.21.09.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:24:16 -0700 (PDT)
Date: Wed, 21 Oct 2026 18:24:12 +0200
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
Message-ID: <atjiW8bnqDZ8zb5t@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-14-jiri@resnulli.us>
 <179245258505.58760.3972297562218204862.b4-review@b4>
 <atjEgLYpgbZNzfkZ@FV6GYCPJ69>
 <20261021144951.GR3008132@nvidia.com>
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
In-Reply-To: <20261021144951.GR3008132@nvidia.com>

Wed, Oct 21, 2026 at 04:49:51PM +0200, jgg@nvidia.com wrote:
>On Wed, Oct 21, 2026 at 04:23:17PM +0200, Jiri Pirko wrote:
>> >> +    attr-sets:
>> >> +      - name: item-request
>> >> +        attrs: item.index
>> >> +        optional-attrs:
>> >> +          - item.label
>> >> +          - item.data
>> >> +      - name: item-reply
>> >> +        attrs: item.index
>> >> +        optional-attrs: item.label
>> >> +      - name: items-reply
>> >> +        optional-attrs: list.item
>> >
>> >I haven't quite figured out what attr-sets is about. I think these
>> >blocks should have some # comments with more guidance what is going on.
>> 
>> "group" defines attrs with all the description once. "set" just puts
>> together multiple atrrs from multiple groups. Will try to document it
>> more clearly.
>
>Maybe also include a explanation why it is like this, how it should be
>used, etc.

Okay.


>
>> >> +
>> >> +    ops:
>> >> +      - name: item-set
>> >> +        type: action
>> >> +        optional: true
>> >> +        request:
>> >> +          attrs: item-request
>> >> +      - name: items-dump
>> >> +        type: query
>> >> +        availability: dynamic
>> >> +        pre-post: true
>> >> +        reply:
>> >> +          attrs: items-reply
>> >> +        suggested-reply-length: 4096
>> >> +      - name: item-changed
>> >> +        type: event
>> >> +        reply:
>> >> +          attrs: item-reply
>> >> +
>> >> +An attribute has one payload form: ``type``, ``enum``, ``flags``, ``attrs``, or
>> >> +``blob``. An attr set names one message level. ``attrs`` are required and
>> >> +``optional-attrs`` are optional. Its bounds and membership are ABI.
>> >
>> >The attribute first point of view is maybe a little too netlinky, I
>> >prefer to think of this as a system call first, with a first class
>> >'query' to get a list of things
>> >
>> >Alot of stuff this is going to deal with won't be the netlink esque
>> >'dump a table, set a table' kind of flow, but a bunch of different
>> >system calls with arguments.
>> 
>> 
>> Can you elaborate a bit more about this please? I'm not clear about what
>> you mean by this. "'query' to get a list of things" sound cryptic to me.
>> Are you talking about doc or about family yaml as well?
>
>Just documentation. Netlink sort of evolved from a table row based API
>concept into something more complete, but here we are starting more
>from a systemcall concept that also has some first class tables too.
>
>Maybe it just isn't clear what the original doc paragraph is trying to
>say.

Okay. Will redo.


>
>> >> +.. code-block:: c
>> >> +
>> >> +    int ctlv_example_vendor_details_extension_fill(
>> >> +                            void *priv, struct ctlv_op_ctx *ctx,
>> >> +                            const struct ctlv_cursor *request,
>> >> +                            struct ctlv_cursor *nest)
>> >> +    {
>> >> +            ctlv_example_vendor_vendor_serial_put(nest,
>> >> +                                                   example_serial(priv));
>> >> +            return 0;
>> >> +    }
>> >
>> >I suppose this like RDMA and each HW driver using this gets its own
>> >full scheme tree that only has its own stuff in it?
>> 
>> It's the "family". Each child inheriting a subsystem family. It fills
>> up the subsystem family defines stubs/extensions. It can add ops too.
>
>I haven't got that far in the patches, but I think it would be good to
>spend more time here explaining the fundamentals of how the extension
>mechanism is expected to be used..
>
>It looks like RDMA to me where you have some 'common' and some
>'driver' parts but at this point in the docs it isn't clear how that
>is reached. Like does each driver gets its own family? What is a

Depends on the consumer/subsystem. But esentially yes. That is what I'm
doing for "attestation". This patchset introduces ctlv-attestation-tdx.
Next we will have ctlv-attestation-tpm, ctlv-attestation-firme,
ctlv-attestation-armcca ctlv-attestation-spdm and others.


>'family chain' etc Where is it reported?

families_dump op of ctlv "root" family. Output is array of {id,name}
tuples.


>
>> >What about userspace, it "knows" somehow what to do?
>> 
>> Userspace sees the family chain. It also has ability to do introspection
>> seeing right away which op supports with attrs in which nests.
>
>I was hoping the introspection would not be essential to use the
>interface..

Depends on the user/subsystem. Either families_dump op could be used of
udev uvevents that also carry family inheritance chain:
    CTLV_FAMILY=ctlv-attestation-tdx
    CTLV_COMPATIBLE_0=ctlv
    CTLV_COMPATIBLE_1=ctlv-attestation
    CTLV_COMPATIBLE_2=ctlv-attestation-tdx
    CTLV_COMPATIBLE_N=3


