Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CD737F8AF
	for <linux-coco@lists.linux.dev>; Wed,  8 Jul 2026 13:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783518528; cv=none; b=HmSqMbJP+XBZ1C+muKuZSdOPtrhYHL0iRUSxJDksbq5CRJ+LE6OuKntt+LVAZE7BFESzfmGAeY64juIyqxgpHiEEfghsM8gxPJRjlVyXIywp1XT8vcmxBJDnXMnMkocFr2mQc+3H95lhCBnUgQHdYVnlg8qdMhVIb0pwiIoCmSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783518528; c=relaxed/simple;
	bh=/OWJXGJs8SSkmcHPkdwWCPWcLueZZf5qaZwsy+85OT4=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=mBXGtRBP/djLqSUcMSOwAvEmV7hVRBq0ENfw9bEq+XpFBhH+ZNrV05IQMbsHQ3HPUGyfskpqF3j6fI8r0BEEJXZup0cPxH7vYrKu/rydMRFm9231TQ19VEHzRP56asGXOddOAcjYImmUdovCZ9FI/IINDQhQU+f0b53nJAsBOkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dWR3mgf+; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dWR3mgf+"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39c7ac9b8c3so5309501fa.0
        for <linux-coco@lists.linux.dev>; Wed, 08 Jul 2026 06:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783518525; x=1784123325; darn=lists.linux.dev;
        h=content-type:mime-version:user-agent:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pMIZknUnUy6XFCDmMjtt4ptvm8FYoUm42a75htqi/WM=;
        b=dWR3mgf+MEqBPJzGetq268d4uYpoYpy+3mRzPPCvxZo+qDt070IdX6uCH5/V3l8E3l
         yoOdKfJWWS/CL7nhRim7mpf19qpVC2vXCgoiGbCcpqYLqZ22Y+MEpQ9OsNkNhqeX46Hc
         hPh9eiBAbc16UGviz6XvUDGNRRov5BwqqFm6DqR9KKWlMaa4wkbjR6dIp6LhktyDuGlP
         0D9/8w5Q8Y4ITvewHNesQi+WxLiBW+2tw3lAuYFdiqgs76Xi979QGx1V0vKldw5i0A0x
         abC8SSr8ekgcmpweP345kVduh2y1YgxLATnluwg1oQCwMMGbVgKXXptBLp3aAD8ETYgc
         PIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783518525; x=1784123325;
        h=content-type:mime-version:user-agent:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pMIZknUnUy6XFCDmMjtt4ptvm8FYoUm42a75htqi/WM=;
        b=rC3C4yzUViVQm9GrfI5RqiSqV+u5ECGTa0FtJoMYgFLqaVRB60WD9Zakk+YFB7/dr9
         btI4XFj2JGTODus60VLtS4tREJ5SBz+8ODVT4rR+cEjzc9VXE/JfHpp3eePt9K+rH10L
         /MowGMWoYMjtBCsfjehrD155xLFuWSFW8X7RvCyDN7aWn6zgHSC4KI/6NIkXlDrNhU8y
         eSwKoGarVHlYboWiwNMgN7xp1koxnh63eE09T8KVDikWp9JdVkNAnjqidPOCGyKIQhdF
         4wDkjuU64DEpNtKg8ZZlFlPEHCgd6PQdSWKahydnCgmuu3+mvub6qumJFNs2351DPdLA
         VEWA==
X-Gm-Message-State: AOJu0Yx8jcIkvieWDEWlbPy9tpiUDyBki1JqKebLakZDFcyhQc9qdmax
	aKwRdASFJ2ZCYfySGV+7gDO3oPTmJmx2nruY2pKAs7k77E/+zai95/RY
X-Gm-Gg: AfdE7cmUdMCbHEaKFK5RDIwM6pDvSyQV4Rv0/WEHx4xUGwiK6eM+7x8xKodcFbOF6uF
	jmaHjigkYRqag8JZZxCFz5qdjzCQLciDXyL8vEJfweouK/ZQ9ZAVvjY4MIjvB9pJK6EAVYh+709
	EyJelh57pcy7tR0N2g1KZwQt6A8VyhCmvPdS8mPmJG2yIMhAY4JwJ/BdOZn/qfXaOgdphKB2ZBQ
	oT41QfD12XkN88tGnriZ6PlPniFUdpxzoFGfRxqtitI35BL+sC/qs1JZfl14iehO/+8rg4ej1xg
	wA2BQDMH8zY80R5ddmO8LUca1BgjIDskTwDMStBcu3iJAIInJg+NyjQPSuk6iqw+Bzo5nap+J3+
	VkHc2xb7F/NXjsTATs3ApDzdy3/WdwwUlBtUhmZ2digNswgfiq/lHa8BRTkT9KT7FFMP/u4C1R2
	Dfempezmv+3t2xFSj2gDIdHEYiPUNeGw==
X-Received: by 2002:a05:6512:6205:b0:5b0:eda:de1b with SMTP id 2adb3069b0e04-5b0114440f8mr751542e87.16.1783518525235;
        Wed, 08 Jul 2026 06:48:45 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:eccc:7ea2:9458:892d])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ad3614fsm31087491fa.12.2026.07.08.06.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 06:48:44 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: Dan Williams <djbw@kernel.org>
Cc: linux-coco@lists.linux.dev,  linux-pci@vger.kernel.org,
  driver-core@lists.linux.dev,  ankita@nvidia.com,  Alistair Francis
 <alistair.francis@wdc.com>,  Lukas Wunner <lukas@wunner.de>,  Jakub
 Kicinski <kuba@kernel.org>
Subject: Re: [PATCH 02/15] tools: ynl: Teach pyynl to handle blobs
In-Reply-To: <20260705220819.2472765-3-djbw@kernel.org>
Date: Wed, 08 Jul 2026 14:48:28 +0100
Message-ID: <m2ldblbnir.fsf@gmail.com>
References: <20260705220819.2472765-1-djbw@kernel.org>
	<20260705220819.2472765-3-djbw@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Dan Williams <djbw@kernel.org> writes:

> The generic "device evidence" facility wants to convey large objects
> (certificate chains, measurements) and support various security commands
> relative to that evidence (like validate) [1].
>
> Update pyynl to understand the "bloblen" property indicates:
> * the associated attribute is a variable length byte array
> * it is multi-attr where each message with the same attribute represents
>   chunks of the byte array
> * the byte array's size is conveyed in a scalar attribute named by the
>   "bloblen" property.
> * the attribute identified by "bloblen" always arrives in a message before
>   the first chunk of the associated blob
>
> A "multi-attr" without "bloblen" retains the legacy behavior where repeated
> reception of the same attribute across messages results in a new instance
> of the object. The new behavior causes repeated reception of an
> attribute to be treated as filling consecutive bytes of an array.
>
> Assisted-by: Codex:GPT-5
> [codex: drafted initial python changes]
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Cc: Lukas Wunner <lukas@wunner.de>
> Cc: Donald Hunter <donald.hunter@gmail.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Link: http://lore.kernel.org/20260318170014.6650d2bf@kernel.org [1]
> Signed-off-by: Dan Williams <djbw@kernel.org>
> ---
>  tools/net/ynl/pyynl/lib/nlspec.py | 12 ++++++
>  tools/net/ynl/pyynl/lib/ynl.py    | 62 ++++++++++++++++++++++++++++++-
>  2 files changed, 72 insertions(+), 2 deletions(-)

I am mid-review of this but I think it could be simplified. See initial
thoughts below. Can you show me how to configure a test env so I can try
it out?

>
> diff --git a/tools/net/ynl/pyynl/lib/nlspec.py b/tools/net/ynl/pyynl/lib/nlspec.py
> index 0469a0e270d0..4764263968ea 100644
> --- a/tools/net/ynl/pyynl/lib/nlspec.py
> +++ b/tools/net/ynl/pyynl/lib/nlspec.py
> @@ -172,6 +172,7 @@ class SpecAttr(SpecElement):
>          selector      string, name of attribute used to select
>                        sub-message type
>  
> +        bloblen       string, name of attr which reports the blob length
>          is_auto_scalar bool, attr is a variable-size scalar
>      """
>      def __init__(self, family, attr_set, yaml, value):
> @@ -181,6 +182,7 @@ class SpecAttr(SpecElement):
>          self.value = value
>          self.attr_set = attr_set
>          self.is_multi = yaml.get('multi-attr', False)
> +        self.bloblen = yaml.get('bloblen')
>          self.struct_name = yaml.get('struct')
>          self.sub_type = yaml.get('sub-type')
>          self.byte_order = yaml.get('byte-order')
> @@ -191,6 +193,10 @@ class SpecAttr(SpecElement):
>  
>          self.is_auto_scalar = self.type in ("sint", "uint")
>  
> +        if self.bloblen and not self.is_multi:
> +            raise SpecException(
> +                f"Attribute '{attr_set.name}.{self.name}' has bloblen without multi-attr")
> +
>  
>  class SpecAttrSet(SpecElement):
>      """ Netlink Attribute Set class.
> @@ -355,6 +361,8 @@ class SpecOperation(SpecElement):
>          attr_set        attribute set name
>          fixed_header    string, optional name of fixed header struct
>  
> +        dump_blob_attrs set, reply blob attribute names which may span messages
> +
>          yaml            raw spec as loaded from the spec file
>      """
>      def __init__(self, family, yaml, req_value, rsp_value):
> @@ -369,6 +377,7 @@ class SpecOperation(SpecElement):
>          self.is_async = 'notify' in yaml or 'event' in yaml
>          self.is_resv = not self.is_async and not self.is_call
>          self.fixed_header = self.yaml.get('fixed-header', family.fixed_header)
> +        self.dump_blob_attrs = frozenset()

Initialising to None would avoid some other logic.

>  
>          # Added by resolve:
>          self.attr_set = None
> @@ -388,6 +397,9 @@ class SpecOperation(SpecElement):
>              raise SpecException(f"Can't resolve attribute set for op '{self.name}'")
>          if attr_set_name:
>              self.attr_set = self.family.attr_sets[attr_set_name]
> +            reply_attrs = self.yaml.get('dump', {}).get('reply', {}).get('attributes', ())
> +            self.dump_blob_attrs = frozenset(
> +                name for name in reply_attrs if self.attr_set[name].bloblen)
>  
>  
>  class SpecMcastGroup(SpecElement):
> diff --git a/tools/net/ynl/pyynl/lib/ynl.py b/tools/net/ynl/pyynl/lib/ynl.py
> index 092d132edec1..f21b68043bd3 100644
> --- a/tools/net/ynl/pyynl/lib/ynl.py
> +++ b/tools/net/ynl/pyynl/lib/ynl.py
> @@ -998,6 +998,47 @@ class YnlFamily(SpecFamily):
>          else:
>              rsp[name] = [decoded]
>  
> +    def _blob_fill(self, buf, off, chunks, name):
> +        for chunk in chunks:
> +            end = off + len(chunk)
> +            if end > len(buf):
> +                raise YnlException(f"Blob '{name}' data exceeds reported length")
> +            buf[off:end] = chunk
> +            off = end
> +        return off
> +
> +    def _blob_init(self, op, rsp, blob_attrs):
> +        """
> +        Start a new blob object. Preallocate each blob payload using the
> +        length carried ahead of the data and copy in the first chunk(s).
> +        Return the per-attribute write offsets for any following messages.
> +        """
> +        offsets = {}
> +        for name in blob_attrs:
> +            if name not in rsp:
> +                continue
> +            length = rsp.get(op.attr_set[name].bloblen, 0)
> +            buf = bytearray(length)
> +            offsets[name] = self._blob_fill(buf, 0, rsp[name], name)
> +            rsp[name] = buf
> +        return offsets
> +
> +    def _blob_extend(self, rsp, update, blob_attrs, offsets):
> +        """
> +        Continue filling the previous object's blob(s) when the current
> +        message carries only blob continuation attributes.
> +        """
> +        if any(name in rsp and name not in blob_attrs for name in update):
> +            return False
> +
> +        for name, value in update.items():
> +            if name in blob_attrs and name in rsp:
> +                offsets[name] = self._blob_fill(rsp[name], offsets.get(name, 0),
> +                                                value, name)
> +            else:
> +                rsp[name] = value
> +        return True
> +
>      def _resolve_selector(self, attr_spec, search_attrs):
>          sub_msg = attr_spec.sub_message
>          if sub_msg not in self.sub_msgs:
> @@ -1356,7 +1397,10 @@ class YnlFamily(SpecFamily):
>          for (method, vals, flags) in ops:
>              op = self.ops[method]
>              msg = self._encode_message(op, vals, flags, req_seq)
> -            reqs_by_seq[req_seq] = (op, vals, msg, flags)
> +            blob_attrs = None
> +            if Netlink.NLM_F_DUMP in flags:
> +                blob_attrs = op.dump_blob_attrs or None
> +            reqs_by_seq[req_seq] = (op, vals, msg, flags, blob_attrs)

I think this hunk can be dropped and instead use op.dump_blob_attrs directly

>              payload += msg
>              req_seq += 1
>  
> @@ -1365,6 +1409,7 @@ class YnlFamily(SpecFamily):
>          done = False
>          rsp = []
>          op_rsp = []
> +        blob_off = {}
>          while not done:
>              reply, ancdata = self._recvmsg()
>              nsid = self._decode_nsid(ancdata)
> @@ -1372,13 +1417,14 @@ class YnlFamily(SpecFamily):
>              self._recv_dbg_print(reply, nms)
>              for nl_msg in nms:
>                  if nl_msg.nl_seq in reqs_by_seq:
> -                    (op, vals, req_msg, req_flags) = reqs_by_seq[nl_msg.nl_seq]
> +                    (op, vals, req_msg, req_flags, blob_attrs) = reqs_by_seq[nl_msg.nl_seq]
>                      if nl_msg.extack:
>                          nl_msg.annotate_extack(op.attr_set)
>                          self._decode_extack(req_msg, op, nl_msg.extack, vals)
>                  else:
>                      op = None
>                      req_flags = []
> +                    blob_attrs = None
>  
>                  if nl_msg.error:
>                      raise NlError(nl_msg)
> @@ -1388,6 +1434,11 @@ class YnlFamily(SpecFamily):
>                          print(nl_msg)
>  
>                      if Netlink.NLM_F_DUMP in req_flags:
> +                        if blob_attrs:
> +                            for obj in op_rsp:
> +                                for name in blob_attrs:
> +                                    if isinstance(obj.get(name), bytearray):
> +                                        obj[name] = bytes(obj[name])
>                          rsp.append(op_rsp)
>                      elif not op_rsp:
>                          rsp.append(None)
> @@ -1414,6 +1465,13 @@ class YnlFamily(SpecFamily):
>                  rsp_msg = self._decode(decoded.raw_attrs, op.attr_set.name)
>                  if op.fixed_header:
>                      rsp_msg.update(self._decode_struct(decoded.raw, op.fixed_header))
> +
> +                if blob_attrs:
> +                    if op_rsp and self._blob_extend(op_rsp[-1], rsp_msg,
> +                                                    blob_attrs, blob_off):
> +                        continue
> +                    blob_off = self._blob_init(op, rsp_msg, blob_attrs)
> +

This approach seems unnecessary for pyynl. Just let multi-attr do its
thing and then concatenate them at the end.

>                  op_rsp.append(rsp_msg)
>  
>          return rsp
