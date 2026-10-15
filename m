Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973C153A8AB
	for <linux-coco@lists.linux.dev>; Thu, 15 Oct 2026 14:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075919; cv=none; b=PjIH7Xm/01XIS2dZcHNUwVDpa93rYNrJy+j9cBAsuixRAkQ5NYxbfSjoe3bXytZBj3+WRm12//RSE9pQOLayb4h4JOFpUwakHxaIPCc317QT6KvVNZInaBC2d1/NWcwCZVzFPB5ZKfi+9QfkJYzRykFZoubwqR1hGJoZ2CWQ9Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075919; c=relaxed/simple;
	bh=5CPU21rxBz2NnkxtVuiqFPUDFhLJ974JBxElxwH45eg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e7FwokFaKec7ajdgOr5KJKIX7F1mVQCV4YdULZBnlBGfhnYbqdmSkwnLP3h++gUg9ep6bIAdR1yw+Ya2hjMpi7pf+5dXJGXtDNOsr/yeyuo6D0zqEItyxgnVzy8vqXhqa/+S5HRk/bMLFdKNHShpw3F7oXm4kS9IYW18mrhmNnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=G5NB/C+2; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="G5NB/C+2"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2dc63f8d8aso944888466b.0
        for <linux-coco@lists.linux.dev>; Thu, 15 Oct 2026 07:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1792075914; x=1792680714; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zr2mYU416leUWVQwDk2hNPjEw/BFcRDpQ57g0Pjiojc=;
        b=G5NB/C+2zzlC2r6/XigBEiRk6Aa8ppltWvOhwwYEf9w+eomg6BLXlLppU+cwQswIev
         hlNpn6awMqWzXUMflOTlCfM47+jM3T72pWe0jX2Q7okXYEY11sCZLC5bkOL+5YaQBsCF
         FVtHImfGjBX8O4TU9jS5Nh7HKN0zw9Hxvj4j4FrlYE/risNc0WizSunQhPZ5QJh5PIFy
         Mgd4AwnS4So/+e+FIqVGtAVY8LyxIieCQLao6iWTMNCRewOLqHlP2tWK+9D7JTxaeFFn
         26HrZMU5dcR/4eTv2PLbWrx9JKvaF+PlpVxZ8V0Gc4DWfoSvmc9PSqrsApXHBlGcWtS0
         Mjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075914; x=1792680714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zr2mYU416leUWVQwDk2hNPjEw/BFcRDpQ57g0Pjiojc=;
        b=QfeSrjAuI0kti8ZTOsPP6piQGZInIHU2PkesMd6iC6UJ3Qs7o4oEPRq/en916NDkt6
         8QbFzukh4vWv1xcE6PPns7jgKScrde32uGPfLXVmeoHwMobBBXnTwBFSzH0xsy11mQwi
         8SqOcJhak+sNwryMoirL4tHtsOWGK5bagiRdyDe78QczvUMErFHuFUCPY5zHjrkBLKla
         KSlLhJmKE2La660QWz73z26R0zlBe6jDpLVHFCVCTIaeATUdg4NZnpePS6iIeEE/HZqx
         6XWdpj4bQck6m95s75P19UE4pmv5dTIP8XC+BAw3ETPYGibHG49qJzTB/AlFRe41WaKc
         dixA==
X-Gm-Message-State: AFq9FYKnXEiDZjFt+qnnY9lUAUJob4yL0phW64TJQd0aCdduhFGgDftJ
	PB3MqS6q9fl8VD0z5GSfqaa6FlteMbRVfxaLUzlPKsO2PZxntEMYbaA855cX0eyD7OFQp1ERzSX
	ObgAo
X-Gm-Gg: AYBFou10Ix1jNHwTeqPAKu9VYtIvmtuf+GQwtLKX1ZAHXcpKKD4YUYUS+Yw3rvjPL2Z
	HD8nsDYY6mq/w7zpM/SeReSxiIqpaJYyGsS4V6UN6QKUpwDkvaULG/L/UjHCtr7FPa0XvAkRiu3
	fXrvIA7P/2Rukv3r7nWaabi0gSZ+6K3jHMReQbwUs1mvDYXvPK+OQ0Kvacz6GAO1AvYufrqh2nU
	lVJ0vlIDzlg+znIeWyfo6DnSvjd0XZUl3ZLqku0Aa1q9crTX9mpuAgFRKOhRtqZq0EAwQXVBQkW
	UV6118mg0pnNJcpmpi8p9tmzWJI5qKSkkSSevRdcnUZTCaVYauY+qTkXyq76zp9LjpGvgIG0VQj
	uWXk2P+3u7HgrcSGrBSnBdI21v9bmlc1X3VWm51MKd2Va8z8JZrsCjg8Xik2adLQtJdT7Vtm3Eb
	jxf5iPSccD4+ObPrp8G+gQUev13rvSIO7PG9WjJyZCZL7XJx2YbZFwhOR5CBQBJW740hMnVGPh9
	lSE0hK0yA==
X-Received: by 2002:a17:907:9618:b0:c2e:7e0a:572f with SMTP id a640c23a62f3a-c31aa017729mr1853169366b.21.1792075913490;
        Thu, 15 Oct 2026 07:51:53 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3f8557c767sm72621566b.50.2026.10.15.07.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:51:53 -0700 (PDT)
From: Jiri Pirko <jiri@resnulli.us>
To: linux-coco@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org,
	x86@kernel.org,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	jgg@ziepe.ca,
	david.quigley@intel.com,
	lukas@wunner.de,
	ksinyuk@kernel.org,
	rodrigo.vivi@intel.com,
	cedric.xing@intel.com,
	sameo@meta.com,
	drdeeglaze@gmail.com,
	James.Bottomley@HansenPartnership.com,
	aik@amd.com,
	jpiotrowski@nvidia.com,
	qinkun@google.com,
	pgonda@google.com,
	jic23@kernel.org,
	alistair.francis@wdc.com,
	ankita@nvidia.com,
	suzuki.poulose@arm.com,
	kas@kernel.org,
	rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com,
	dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com,
	peter.fang@intel.com
Subject: [PATCH RFC 13/20] Documentation: ctlv: Describe how to write a family
Date: Thu, 15 Oct 2026 16:50:46 +0200
Message-ID: <20261015145053.3664509-14-jiri@resnulli.us>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015145053.3664509-1-jiri@resnulli.us>
References: <20261015145053.3664509-1-jiri@resnulli.us>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jiri Pirko <jiri@nvidia.com>

Describe the YAML language, generated family descriptors, lifecycle,
operations, events, blobs, inheritance and compatible extension rules.

Assisted-by: Cursor: GPT-5.6 Sol
Assisted-by: Cursor: Claude Opus 5.5
Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
 Documentation/driver-api/ctlv.rst  | 422 +++++++++++++++++++++++++++++
 Documentation/driver-api/index.rst |   1 +
 MAINTAINERS                        |   1 +
 3 files changed, 424 insertions(+)
 create mode 100644 Documentation/driver-api/ctlv.rst

diff --git a/Documentation/driver-api/ctlv.rst b/Documentation/driver-api/ctlv.rst
new file mode 100644
index 000000000000..461e2977a483
--- /dev/null
+++ b/Documentation/driver-api/ctlv.rst
@@ -0,0 +1,422 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=====================
+Writing a CTLV family
+=====================
+
+:Author: Jiri Pirko
+
+A CTLV family is a YAML specification plus the callbacks named by its generated
+header. CTLV validates requests before a callback sees them. The wire ABI is
+:doc:`/userspace-api/ctlv`; family specifications are under
+``Documentation/ctlv/specs``.
+
+The code here is a small invented family, ``ctlv-example``.
+
+Add the specification, registry entry, and output manifest entry in one change::
+
+    Documentation/ctlv/specs/ctlv-example.yaml
+    Documentation/ctlv/families.yaml
+    Documentation/ctlv/generated-files.yaml
+
+``families.yaml`` is append-only. Its array index is the family ID and is part
+of every generated attribute and operation ID. Never reorder, remove, rename,
+or reuse an entry. ``Documentation/ctlv/abi/families.registry.yaml`` is the
+checked-in registry ABI. The output manifest selects the generated UAPI,
+kernel and userspace paths and generation modes.
+
+Generate and verify them with::
+
+    make -C tools/ctlv regen
+    make -C tools/ctlv all
+
+Never edit a generated output. Change the YAML or generator and regenerate it.
+Optional RST reference pages are written to
+``Documentation/output/ctlv/families`` by::
+
+    make -C tools/ctlv docs
+
+Write the specification
+=======================
+
+.. code-block:: yaml
+
+    # SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
+    %YAML 1.2
+    ---
+    family:
+      name: ctlv-example
+      inherits: ctlv
+      post-init: true
+      pre-fini: true
+
+    attr-groups:
+      - name: item
+        attrs:
+          - name: index
+            type: uint
+            max: 4095
+          - name: label
+            type: string
+            max-length: 63
+          - name: data
+            blob:
+              direction: input
+              allowed-backings: [ va ]
+              max-length: 1048576
+              alignment: 8
+      - name: list
+        attrs:
+          - name: item
+            attrs: item-reply
+            max-occurrences: unlimited
+
+    attr-sets:
+      - name: item-request
+        attrs: item.index
+        optional-attrs:
+          - item.label
+          - item.data
+      - name: item-reply
+        attrs: item.index
+        optional-attrs: item.label
+      - name: items-reply
+        optional-attrs: list.item
+
+    ops:
+      - name: item-set
+        type: action
+        optional: true
+        request:
+          attrs: item-request
+      - name: items-dump
+        type: query
+        availability: dynamic
+        pre-post: true
+        reply:
+          attrs: items-reply
+        suggested-reply-length: 4096
+      - name: item-changed
+        type: event
+        reply:
+          attrs: item-reply
+
+An attribute has one payload form: ``type``, ``enum``, ``flags``, ``attrs``, or
+``blob``. An attr set names one message level. ``attrs`` are required and
+``optional-attrs`` are optional. Its bounds and membership are ABI.
+
+Inheritance and extension points
+================================
+
+A descendant implements only the operations it declares. Inherited operations
+keep the callbacks and operation hooks of their declaring family. Every module
+therefore depends on the module containing its parent implementation.
+
+A parent reserves an extension point with an empty stub set:
+
+.. code-block:: yaml
+
+    attr-groups:
+      - name: device
+        attrs:
+          - name: details
+            attrs: details-extension
+
+    attr-sets:
+      - name: details-extension
+        stub: true
+      - name: device-reply
+        optional-attrs: device.details
+
+A child fills that same set:
+
+.. code-block:: yaml
+
+    family:
+      name: ctlv-example-vendor
+      inherits: ctlv-example
+      pre-init: true
+
+    attr-groups:
+      - name: vendor
+        attrs:
+          - name: serial
+            type: uint
+
+    attr-sets:
+      - name: details-extension
+        optional-attrs: vendor.serial
+
+The parent implementation opens the physical nest and delegates its members:
+
+.. code-block:: c
+
+    if (ctlv_example_device_details_start(reply, &details)) {
+            ret = ctlv_stub_fill(ctx, request_details, &details);
+            ctlv_nest_end(&details);
+            if (ret)
+                    return ret;
+    }
+
+The generated child callback fills it:
+
+.. code-block:: c
+
+    int ctlv_example_vendor_details_extension_fill(
+                            void *priv, struct ctlv_op_ctx *ctx,
+                            const struct ctlv_cursor *request,
+                            struct ctlv_cursor *nest)
+    {
+            ctlv_example_vendor_vendor_serial_put(nest,
+                                                   example_serial(priv));
+            return 0;
+    }
+
+An unfilled stub contributes no nest or message length. Neither side names the
+family on the other side.
+
+Create and destroy a device
+===========================
+
+``ctlv_create()`` takes the leaf family descriptor and leaf initialization
+information:
+
+.. code-block:: c
+
+    struct ctlv_example_vendor_init_info info = {
+            .dev = dev,
+    };
+    struct ctlv_device *ctlvdev;
+
+    ctlvdev = ctlv_create(dev, &ctlv_example_vendor_ctlv_family, &info);
+    if (IS_ERR(ctlvdev))
+            return PTR_ERR(ctlvdev);
+
+A family with ``pre-init: true`` supplies initialization information to its
+direct parent. A typical provider descriptor is static and immutable:
+
+.. code-block:: c
+
+    static const struct ctlv_example_provider example_provider = {
+            .name = "vendor-example",
+            .ops = &example_provider_ops,
+    };
+
+    const void *ctlv_example_vendor_pre_init(const void *init_info)
+    {
+            return &example_provider;
+    }
+
+The leaf's per-device ``init_info`` still reaches its own ``init`` callback; it
+is not forwarded as the parent's descriptor. ``pre_init`` runs leaf to root and
+may return an ``ERR_PTR()``. It must not acquire resources or return automatic
+storage.
+
+Each family supplies ``priv_size``, ``init``, and ``fini``. The YAML flags add
+``pre_init``, ``post_init``, and ``pre_fini`` callbacks. Creation order is::
+
+    leaf -> root     pre_init
+    root -> leaf     init
+                     freeze published operations; start event admission
+    leaf -> root     post_init
+                     register the character device
+
+Select optional operations and their initial dynamic state in ``init``. A
+``post_init`` callback may publish the device to kernel consumers because all
+family privs and event emission are then available.
+
+Normal destruction is ordered as follows::
+
+    withdraw userspace access; drain admitted operation callbacks
+    root -> leaf     pre_fini
+    stop and drain event contexts; queue DEVICE_REMOVED
+    leaf -> root     fini
+
+A family published in ``post_init`` withdraws and drains its consumers in
+``pre_fini``. Provider state and events remain available until all
+``pre_fini`` callbacks finish. ``ctlv_destroy()`` consumes the reference from
+``ctlv_create()``; open file descriptions remain only to drain queued records
+and otherwise fail with ``-ENODEV``.
+
+If ``init`` fails, that callback releases its partial resources and CTLV calls
+``fini`` only for initialized ancestors. A failure after initialization uses
+the normal ``pre_fini`` and ``fini`` ordering.
+
+CTLV allocates one zeroed, cache-line-aligned priv per family. Direct neighbors
+are available without naming their types globally:
+
+.. code-block:: c
+
+    parent = ctlv_priv_parent(priv);
+    child = ctlv_priv_child(priv);
+
+During ``init``, the child is not initialized yet. During ``pre_fini`` it still
+is; during ``fini`` it has already been finalized. Allocate a separately
+aligned object when cache-line alignment is insufficient.
+
+Implement operations
+====================
+
+Action
+------
+
+Generated getters read only validated placements and generated serializers
+write only declared replies:
+
+.. code-block:: c
+
+    int ctlv_example_item_set_action(void *priv, struct ctlv_op_ctx *ctx,
+                                     const struct ctlv_cursor *request,
+                                     struct ctlv_cursor *reply)
+    {
+            u64 index = ctlv_example_item_index_get(request);
+
+            if (item_busy(priv, index))
+                    return ctlv_op_error(ctx, -EBUSY, "item is busy");
+            return item_set(priv, index);
+    }
+
+Use ``_present()`` for optional attributes and ``_for_each()`` for repeated
+ones. ``ctlv_op_error()`` preserves the errno and adds a short diagnostic when
+the caller supplied enough reply space.
+
+Query
+-----
+
+.. code-block:: c
+
+    int ctlv_example_items_dump_query(void *priv, struct ctlv_op_ctx *ctx,
+                                      const struct ctlv_cursor *request,
+                                      struct ctlv_cursor *reply)
+    {
+            struct ctlv_example *example = priv;
+            u64 generation = READ_ONCE(example->generation);
+            u64 cursor = ctlv_op_query_cursor(ctx);
+            struct ctlv_cursor item;
+            u64 i = cursor ? cursor - 1 : 0;
+
+            if (cursor && ctlv_op_query_generation(ctx) != generation)
+                    return -ESTALE;
+            for (; i < example->items_count; i++) {
+                    if (!ctlv_example_list_item_start(reply, &item))
+                            return ctlv_op_query_more(ctx, generation, i + 1);
+                    ctlv_example_item_index_put(&item, i);
+                    ctlv_nest_end(&item);
+            }
+            return ctlv_op_query_done(ctx, generation);
+    }
+
+A continuation cursor is nonzero and advances. Every continuing fragment
+completes a logical leaf. Call ``ctlv_op_query_more()`` while cursors for open
+continuation nests are alive. A generation mismatch returns ``-ESTALE``.
+
+Hooks and availability
+======================
+
+The leaf family's hooks wrap each effective non-core action or query. An
+operation with ``pre-post: true`` has its declaring family's pair inside them::
+
+    family pre -> operation pre -> availability check -> callback
+               -> operation post -> family post
+
+Each successful pre hook has one post hook. A failing pre hook undoes its own
+work. Hooks may sleep and must not retain ``ctx``. Each hook and callback gets
+the priv of the family implementing it.
+
+Optional and dynamic operations are separate choices:
+
+.. code-block:: c
+
+    /* During init: publish this optional operation on this device. */
+    ctlv_example_item_set_provide(ctlvdev);
+
+    /* At runtime: temporarily refuse a published dynamic operation. */
+    ctlv_example_items_dump_disable(ctlvdev);
+    ctlv_example_items_dump_enable(ctlvdev);
+
+Declare the latter with ``availability: dynamic``. An unpublished optional
+operation has no schema entry. A disabled operation remains discoverable and
+returns ``-EOPNOTSUPP``; a state change emits ``op-changed``.
+
+Blobs
+=====
+
+A blob attribute describes caller-owned memory. Resolve it only in the callback
+that received its request and release every successful resolve before return:
+
+.. code-block:: c
+
+    blob = ctlv_example_item_data_resolve(ctx, request);
+    if (IS_ERR(blob))
+            return PTR_ERR(blob);
+
+    ret = ctlv_blob_read(blob, 0, buf, ctlv_blob_len(blob));
+    put_ret = ctlv_blob_put(blob);
+    return ret ?: put_ret;
+
+The schema fixes direction, backing, length, and alignment. Resolution holds
+the backing for the ioctl.
+
+Events
+======
+
+.. code-block:: c
+
+    ctx = ctlv_example_item_changed_create(ctlvdev, &event, GFP_KERNEL);
+    if (IS_ERR(ctx))
+            return PTR_ERR(ctx);
+    ctlv_example_item_index_put(event, index);
+    return ctlv_event_emit(ctx);
+
+Exactly one of ``ctlv_event_emit()`` and ``ctlv_event_abort()`` ends the context. The
+GFP argument covers subscriber copies; atomic producers use ``GFP_NOWAIT`` or
+``GFP_ATOMIC``. Event APIs are not called from interrupt context, and hooks do
+not run around events.
+
+If an event occurred but allocation failed, commit the state change and call
+``ctlv_event_lost()``. It neither allocates nor sleeps. Do not use it for an
+aborted event or for per-subscriber drops already tracked by
+``ctlv_event_emit()``.
+
+If hardware changed before an event context could be allocated, the family
+must commit its invalidation and explicitly report the missing notification:
+
+.. code-block:: c
+
+    invalidate_stale_state(priv);
+    priv->generation++;
+
+    ctx = ctlv_example_thing_happened_create(ctlvdev, &event, GFP_ATOMIC);
+    if (IS_ERR(ctx)) {
+            if (PTR_ERR(ctx) == -ENOMEM)
+                    ctlv_event_lost(ctlvdev,
+                                    CTLV_EXAMPLE_OP_THING_HAPPENED);
+            return;
+    }
+    ctlv_example_generation_put(event, priv->generation);
+    ctlv_op_emit(ctx);
+
+``ctlv_event_lost()`` allocates nothing and does not sleep. For each subscribed
+file description it advances the event sequence and aggregates the loss into
+the preallocated ``EVENT_OVERFLOW`` record. The caller keeps the device alive
+and serializes the report with normal emission of that event. Like event
+emission, it is not called from interrupt context. It is only for an event that
+actually occurred but could not be constructed: do not call it for an aborted
+event or for copy-allocation and full-queue drops already accounted for by
+``ctlv_op_emit()``. Reports after event shutdown or the terminal
+``DEVICE_REMOVED`` record are ignored.
+
+Reporting an error
+------------------
+
+A callback returns a negative errno, and that is what the ioctl returns. Where
+CTLV itself refuses a message it also writes error information into the
+caller's reply buffer, naming the reason and the offset of the offending
+attribute. A family implementation does not build that; it adds its own errno
+and its reply.
+
+Configuration
+=============
+
+``CONFIG_CTLV``
+    CTLV. A family implementation selects it.
diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index 6601a258690f..e85a7a982bfc 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -37,6 +37,7 @@ of interest to most developers working on device drivers.
 
    early-userspace/index
    connector
+   ctlv
    device-io
    devfreq
    dma-buf
diff --git a/MAINTAINERS b/MAINTAINERS
index b308e3a5f0b6..983437acd388 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7006,6 +7006,7 @@ M:	Jiri Pirko <jiri@resnulli.us>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/ctlv/
+F:	Documentation/driver-api/ctlv.rst
 F:	Documentation/userspace-api/ctlv.rst
 F:	drivers/ctlv/
 F:	include/linux/ctlv*.h
-- 
2.56.0

